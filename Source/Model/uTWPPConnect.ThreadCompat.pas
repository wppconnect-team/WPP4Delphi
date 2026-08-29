(*####################################################################################################################
  License
  Copyright 2022 WPPConnect Team https://wppconnect-team.github.io/

  Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance
  with the License. You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0
  Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on
  an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the
  specific language governing permissions and limitations under the License.

                              WPPCONNECT - Componente de comunicação (Não Oficial)
                                           https://wppconnect-team.github.io/
####################################################################################################################
  Objetivo: substituto de TThread.CreateAnonymousThread / TThread.Synchronize com closure (Delphi) para o FPC,
  que nao suporta "reference to procedure"/funcoes anonimas com captura de variaveis (testado e confirmado
  nesta unit nao compilar tal sintaxe no FPC 3.2.2). O FPC tem seu proprio mecanismo de closure, mais antigo:
  procedimento aninhado ("is nested") - uma funcao declarada dentro de outra, com acesso as variaveis locais
  dela. E funcionalmente equivalente ao "reference to procedure" do Delphi, so muda a sintaxe de declaracao
  (precisa ser nomeado, nao pode ser um bloco anonimo inline).

  Padrao de uso (substitui "TThread.CreateAnonymousThread(procedure begin ... end)"):

    procedure TWPPConnect.AlgumMetodo;
    var
      lThread: TThread;
      {$IFDEF FPC}
      procedure Trabalho;
      begin
        ...corpo original do anonymous method...
        SynchronizeNested(Sincronizado); // ver abaixo
      end;
      procedure Sincronizado;
      begin
        ...corpo original do TThread.Synchronize(nil, procedure begin ... end)...
      end;
      {$ENDIF}
    begin
      {$IFDEF FPC}
      lThread := CreateAnonymousThreadCompat(Trabalho);
      {$ELSE}
      lThread := TThread.CreateAnonymousThread(procedure begin ... end);
      {$ENDIF}
      lThread.Start;
    end;

  Validado com programa standalone nesta sessao: captura de variavel do escopo externo funciona
  corretamente atraves da troca de thread (worker -> main via Synchronize), inclusive com dois niveis
  de aninhamento (Trabalho aninhado em AlgumMetodo, Sincronizado aninhado em Trabalho).
####################################################################################################################
*)
unit uTWPPConnect.ThreadCompat;

{$IFDEF FPC}
  {$MODE DELPHI}
  {$MODESWITCH NESTEDPROCVARS}
{$ENDIF}

interface

{$IFDEF FPC}
uses
  Classes;

type
  TNestedProc = procedure is nested;

  // Substituto de TThread.CreateAnonymousThread(procedure begin ... end) do Delphi.
  // AProc deve ser um procedimento aninhado (declarado dentro do metodo chamador),
  // nao um metodo de classe nem um procedimento solto - precisa "enxergar" as
  // variaveis locais do metodo chamador, do mesmo jeito que o anonymous method faria.
  TAnonThread = class(TThread)
  private
    FProc: TNestedProc;
  protected
    procedure Execute; override;
  public
    constructor Create(AProc: TNestedProc);
  end;

// Cria e inicia a thread. Equivalente a TThread.CreateAnonymousThread(...).Start no Delphi,
// mas ja retorna com FreeOnTerminate=False (o chamador decide quando liberar/aguardar,
// igual ao padrao ja usado no restante do componente).
function CreateAnonymousThreadCompat(AProc: TNestedProc): TThread;

// Substituto de TThread.Synchronize(nil, procedure begin ... end) do Delphi. AProc, de novo,
// deve ser um procedimento aninhado. Roda AProc na main thread e so retorna quando ele terminar
// (mesma semantica sincrona do TThread.Synchronize original).
procedure SynchronizeNested(AProc: TNestedProc);
{$ENDIF}

implementation

{$IFDEF FPC}

{ TNestedProcSyncAdapter }

type
  // Embrulha um procedimento aninhado num metodo comum ("of object"), que e o que
  // TThread.Synchronize/Queue exigem (TThreadMethod = procedure of object). Nested
  // procedure e metodo de objeto sao mecanismos diferentes (frame do pai vs. Self),
  // esse adaptador e a ponte entre os dois.
  TNestedProcSyncAdapter = class
  private
    FProc: TNestedProc;
    procedure DoCall;
  public
    constructor Create(AProc: TNestedProc);
  end;

constructor TNestedProcSyncAdapter.Create(AProc: TNestedProc);
begin
  inherited Create;
  FProc := AProc;
end;

procedure TNestedProcSyncAdapter.DoCall;
begin
  FProc();
end;

{ TAnonThread }

constructor TAnonThread.Create(AProc: TNestedProc);
begin
  inherited Create(True); //CreateSuspended
  FProc := AProc;
  FreeOnTerminate := False;
end;

procedure TAnonThread.Execute;
begin
  FProc();
end;

function CreateAnonymousThreadCompat(AProc: TNestedProc): TThread;
begin
  //Nao inicia sozinho - mesmo contrato do TThread.CreateAnonymousThread do Delphi,
  //que tambem exige chamar .Start explicitamente. Isso importa porque varios pontos do
  //componente fazem "lThread.FreeOnTerminate := true;" ENTRE o Create e o Start.
  Result := TAnonThread.Create(AProc);
end;

procedure SynchronizeNested(AProc: TNestedProc);
var
  LAdapter: TNestedProcSyncAdapter;
begin
  LAdapter := TNestedProcSyncAdapter.Create(AProc);
  try
    TThread.Synchronize(nil, LAdapter.DoCall);
  finally
    LAdapter.Free;
  end;
end;

{$ENDIF}

end.
