{####################################################################################################################
                              WPPCONNECT - Componente de comunicação (Não Oficial)
                                           www.wppconnect.com.br
                                            Maio de 2022
####################################################################################################################
    Owner.....: Marcelo           - marcelo.broz@hotmail.com   -
    Developer.: Marcelo           - marcelo.broz@hotmail.com   - +55 17 9.8138-8414

####################################################################################################################
  Obs:
     - Código aberto a comunidade Delphi, desde que mantenha os dados dos autores e mantendo sempre o nome do IDEALIZADOR
       Marcelo;

####################################################################################################################
}

unit uTWPPConnect.ExePath;

interface

{$WARN SYMBOL_PLATFORM OFF}
uses
  System.Classes,  SysUtils,  Windows,
  {$IFDEF DESIGNER_COMP}
    ToolsAPI,
  {$ENDIF}
  uTWPPConnect.Constant;


Type
  TDadosApp = Class(TComponent)
  Private
    FLocalEXE: String;
    FIniProc: Cardinal;
    FLocalProject: String;
    Procedure TrazNomeJs;
    {$IFDEF DESIGNER_COMP}
      function GetPathProject: IOTAProject;
    {$ENDIF}
     Function FindInterno(ADirRoot: String; PFile:String):String;

  Public
    constructor Create(Owner: TComponent); override;
    Function FindDirs(ADirRoot: String; PFile:String):String;
    Property LocalEXE: String       Read FLocalEXE;
    Property LocalProject: String   Read FLocalProject;

  End;

implementation

uses
  Vcl.Forms,  Vcl.Dialogs, uTWPPConnect.Diversos;



{ TDadosApp }

function TDadosApp.FindDirs(ADirRoot, PFile: String): String;
begin
  FIniProc   := GetTickCount;
  Result     := FindInterno(ADirRoot, PFile);
end;

Function TDadosApp.FindInterno(ADirRoot: String; PFile:String): String;
var
  LArquivos: TSearchRec;
begin
  Result := '';
  ADirRoot := IncludeTrailingPathDelimiter(ADirRoot);
  if FindFirst(ADirRoot + '*.*', faDirectory + faArchive, LArquivos) = 0 then
  begin
    Try
      Repeat
        //Segurança contra TRAVADAS se estiuver um um local com muitos arquivos!!
        if (FIniProc - GetTickCount) >= MsMaxFindJSinDesigner then
        Begin
          if (csDesigning in Owner.ComponentState) then
          Begin
            if (FIniProc - GetTickCount) < MsMaxFindJSinDesigner * 10 then
               WarningDesenv(PFile + ' -> Timeout do Search IDE atingido (' + IntToStr(MsMaxFindJSinDesigner) + ') / ' + IntToStr(FIniProc - GetTickCount));
          End;
          Exit;
        End;

        If (LArquivos.Name <> '.') and (LArquivos.Name <> '..') then
        begin
          If (LArquivos.Attr = fadirectory) or (LArquivos.Attr = 48) then
          begin
            result := FindInterno(ADirRoot + LArquivos.Name, PFile);
            if result <> '' then
               Exit;
          end;

          If (LArquivos.Attr in [faArchive, faNormal]) or (LArquivos.Attr = 8224)  then
          Begin
            if AnsiLowerCase(LArquivos.Name) = AnsiLowerCase(PFile) then
            begin
              Result := ADirRoot + LArquivos.Name;
              exit;
            end;
          end;
        end;
      until FindNext(LArquivos)  <> 0;
    finally
      SysUtils.FindClose(LArquivos)
    end;
  end;
end;


constructor TDadosApp.Create;
begin
  //Se estiver em modo DESIGNER tem que catar o local
  //Esta rodando a APLICAção
  //Entao vai valer o que esta configurado no DPR...
  // LocalEXE := ExtractFilePath(Application.exename);
  FIniProc   := GetTickCount;
  Inherited Create(Owner);
  TrazNomeJs;
end;

procedure TDadosApp.TrazNomeJs;
var
  LpastaRaiz: String;
begin
//Agora tem que varrer para achar!!
  LpastaRaiz    := ExtractFilePath(Application.exename);
  FIniProc      := GetTickCount; //rotina de segurança de TIMEOUT
  FLocalEXE     := FindDirs(ExtractFilePath(LpastaRaiz), NomeArquivoInject);
  {$IFDEF DESIGNER_COMP}
    LpastaRaiz    := ExtractFilePath(GetPathProject.FileName);
  {$ENDIF}
  FLocalProject := LpastaRaiz;
end;


{$IFDEF DESIGNER_COMP}

function TDadosApp.GetPathProject: IOTAProject;
var
  LServico: IOTAModuleServices;
  LModulo: IOTAModule;
  LProjeto: IOTAProject;
  LGrupo: IOTAProjectGroup;
  i: Integer;
begin
  Result := nil;
  try
    LServico := BorlandIDEServices as IOTAModuleServices;
    for i := 0 to LServico.ModuleCount - 1 do
    begin
      LModulo := LServico.Modules[i];
      if Supports(LModulo, IOTAProjectGroup, LGrupo) then
      begin
        Result := LGrupo.ActiveProject;
        Exit;
      end else
      Begin
        if Supports(LModulo, IOTAProject, LProjeto) then
        begin
          if Result = nil then
             Result := LProjeto;
        end;
      End;
    end;
  finally
    FIniProc   := GetTickCount;
  end;
end;
{$ENDIF}


end.
