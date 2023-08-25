{####################################################################################################################
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
                                            Maio de 2022
####################################################################################################################
    Owner.....: Daniel Oliveira Rodrigues  - Dor_poa@hotmail.com     - +55 51 9.9155-9228
    Developer.: Joathan Theiller           - jtheiller@hotmail.com   -
                Mike W. Lustosa            - mikelustosa@gmail.com   - +55 81 9.9630-2385
                Robson André de Morais     - robinhodemorais@gmail.com

####################################################################################################################
  Obs:
     - Código aberto a comunidade Delphi, desde que mantenha os dados dos autores e mantendo sempre o nome do IDEALIZADOR
       Mike W. Lustosa;

####################################################################################################################
                                  Evolução do Código
####################################################################################################################
  Autor........: Marcelo Oliveira
  Email........: marcelo.broz@hotmail.com
  Data.........: 07/06/2022
  Identificador: @Marcelo
  Modificação..: Ajustado para Trabalhar com o WPPConnect
####################################################################################################################
}


unit uTWPPConnect.AdjustNumber;

interface

uses
  System.Classes, uTWPPConnect.Classes, System.MaskUtils, uTWPPConnect.Diversos;


{$M+}{$TYPEINFO ON}
type
  TWPPConnectAdjusteNumber  = class(TPersistent)
  private
    FLastAdjustDt: TDateTime;
    FLastAdjuste: String;
    FLastDDI: String;
    FLastDDD: String;
    FLastNumber: String;

    FAutoAdjust: Boolean;
    FDDIDefault: Integer;
    FLengthDDI: integer;
    FLengthDDD: Integer;
    FLengthPhone: Integer;
    FLastNumberFormat: String;
    FLastType: TTypeNumber;
    FAllowOneDigit: Boolean;
    Owner: TComponent;
    Procedure SetPhone(Const Pnumero:String);
  public
    constructor Create(AOwner: TComponent);

    Function  FormatIn(PNum:String): String;
    Function  FormatOut(PNum:String): String;

    property  LastType    : TTypeNumber     Read FLastType;
    property  LastAdjuste : String          Read FLastAdjuste;
    property  LastDDI     : String          Read FLastDDI;
    property  LastDDD     : String          Read FLastDDD;
    property  LastNumber  : String          Read FLastNumber;
    property  LastNumberFormat: String      Read FLastNumberFormat;
    property  LastAdjustDt: TDateTime       Read FLastAdjustDt;
  published
    property AutoAdjust : Boolean           read FAutoAdjust    write FAutoAdjust    default True;
    property LengthDDI  : Integer           read FLengthDDI     write FLengthDDI     default 2;
    property LengthDDD  : Integer           read FLengthDDD     write FLengthDDD     default 2;
    property LengthPhone: Integer           read FLengthPhone   write FLengthPhone   default 9;
    property AllowOneDigitMore: Boolean         read FAllowOneDigit write FAllowOneDigit default True;

    property DDIDefault : Integer           read FDDIDefault   write FDDIDefault  Default 2;
    end;


implementation

uses
  System.SysUtils, uTWPPConnect.Constant;

{ TAdjustNumber }


function TWPPConnectAdjusteNumber.FormatIn(PNum: String): String;
var
  LClearNum: String;
  LInc:Integer;
begin
  if FAllowOneDigit then
    LInc := 1 else
    LInc := 0;

  Result := Pnum;

  try
    if not AutoAdjust then
      Exit;

    //Marcelo Não Validar Número ja Formatado 02/07/2023
    if pos('@c.us', PNum) > 0 then
      Exit;

    //Marcelo Não Validar ID de Grupo ja Formatado 01/08/2023
    if pos('@g.us', PNum) > 0 then
      Exit;

    //Garante valores LIMPOS (sem mascaras, letras, etc) apenas NUMEROS
    Result := PNum;
    LClearNum := TrazApenasNumeros(pnum);

    if Length(LClearNum) < (LengthDDD + LengthPhone + LInc) then
    Begin
      if Length(LClearNum) < (LengthDDD + LengthPhone) then
      Begin
        Result := '';
        Exit;
      End;
    End;

    //Testa se é um grupo ou Lista Transmissao
    if Length(LClearNum) <=  (LengthDDI + LengthDDD + LengthPhone + 1 + LInc) Then //14 then
    begin
      if (Length(LClearNum) <= (LengthDDD + LengthPhone + LInc)) or (Length(PNum) <= (LengthDDD + LengthPhone + LInc)) then
      begin
        if (Copy(LClearNum, 0, LengthDDI) <> DDIDefault.ToString)
        or ((Copy(PNum,1,2) = '55') and (Length(PNum) = 10)) //(55)8125-3929 Ajust com DDD 55
        or ((Copy(PNum,1,2) = '55') and (Length(PNum) = 11)) //(55)98125-3929 Ajust com DDD 55
        then
          LClearNum := DDIDefault.ToString + LClearNum;
        Result := LClearNum +  CardContact;
      end;
    end;
  finally
    if Result = '' then
      raise Exception.Create(MSG_ExceptPhoneNumberError);
    SetPhone(Result);
  end;
end;


function TWPPConnectAdjusteNumber.FormatOut(PNum: String): String;
var
  LDDi, LDDD, Lresto, LMask : String;
begin
 LDDi   := Copy(PNum, 0, FLengthDDI);
 LDDD   := Copy(PNum, FLengthDDI + 1, FLengthDDD);
 Lresto := Copy(PNum, FLengthDDI + FLengthDDD + 1); // + 1, LengthPhone);
 if Length(Lresto) <= 8 then
    LMask := '0000\-0000;0;' else
    LMask := '0\.0000\-0000;0;';

 Result :=  '+' + LDDi + ' (' + LDDD + ') ' + FormatMaskText(LMask, Lresto );
end;

procedure TWPPConnectAdjusteNumber.SetPhone(const Pnumero: String);
begin
  FLastType         := TypUndefined;
  FLastDDI          := '';
  FLastDDD          := '';
  FLastNumber       := '';
  FLastNumberFormat := '';
  FLastAdjustDt     := Now;
  FLastAdjuste      := Pnumero;
  FLastNumberFormat := Pnumero;
  if pos(CardGroup, Pnumero) > 0 then
  begin
    FLastType := TypGroup;
  end else
  Begin
    if Length(Pnumero) = (LengthDDI + LengthDDD + LengthPhone + Length(CardContact)) then
    Begin
      FLastType := TypContact;
    end;
  end;

  if FLastType = TypContact then
  Begin
    FLastDDI          := Copy(Pnumero, 0,           LengthDDI);
    FLastDDD          := Copy(Pnumero, LengthDDI+1, LengthDDD);
    FLastNumber       := Copy(Pnumero, LengthDDI+LengthDDD+1, LengthPhone);
    FLastNumberFormat := FormatOut(FLastNumber);
  End;
end;

constructor TWPPConnectAdjusteNumber.Create(AOwner: TComponent);
begin
  Owner          := Aowner;
  FLastAdjuste   := '';
  FLastDDI       := '';
  FLastDDD       := '';
  FLastNumber    := '';
  FAllowOneDigit := true;
  FAutoAdjust    := True;
  FDDIDefault    := 55;
  FLengthDDI     := 2;
  FLengthDDD     := 2;
  FLengthPhone   := 8;
end;

end.
