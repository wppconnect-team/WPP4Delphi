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
####################################################################################################################}

unit uWPPConnectDecryptFile;

interface

uses System.Classes, Vcl.ExtCtrls, System.Generics.Collections,
  shellapi, Winapi.UrlMon, IdHTTP, Winapi.Windows, uTWPPConnect.Constant;

type
  TWPPConnectDecryptFile = class(TComponent)
  private
    function DownLoadInternetFile(Source, Dest: string): Boolean;
    procedure DownloadFile(Source, Dest: string);
    function shell(program_path:  string):  string;
    function idUnique(id: string): string;
   public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function download(clientUrl, mediaKey, tipo, id: string;ADescriptografar: boolean=true) :string;
  end;

implementation

uses
  System.StrUtils, System.SysUtils, Vcl.Forms;

{ TImagem }

constructor TWPPConnectDecryptFile.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TWPPConnectDecryptFile.Destroy;
begin
  inherited;
end;

procedure TWPPConnectDecryptFile.DownloadFile(Source, Dest: String);
var
  IdHTTP1 : TIdHTTP;
  Stream  : TMemoryStream;
  Url, FileName: String;
begin
  IdHTTP1 := TIdHTTP.Create(nil);
  Stream  := TMemoryStream.Create;
  try
    IdHTTP1.Get(Source, Stream);
    Stream.SaveToFile(Dest);
  finally
    Stream.Free;
    IdHTTP1.Free;
  end;
end;

function TWPPConnectDecryptFile.DownLoadInternetFile(Source, Dest: String): Boolean;
var ret:integer;
begin
  try
    ret:=URLDownloadToFile(nil, PChar(Source), PChar(Dest), 0, nil);
    if ret <> 0 then
    begin
      DownloadFile(Source, Dest) ;
      if FileExists(dest) then
        ret :=  0;
    end;

    Result := ret = 0
  except
    Result := False;
  end;
end;

function TWPPConnectDecryptFile.idUnique(id: string): String;
var
  gID: TGuid;
begin
  CreateGUID(gID);
  result := copy(gID.ToString, 2, length(gID.ToString)  - 2);
end;

function TWPPConnectDecryptFile.download(clientUrl, mediaKey, tipo, id: string;ADescriptografar: boolean=true) :string;
var
  form, imagem, diretorio, arq:string;
begin
  Result    :=  '';
  diretorio := ExtractFilePath(ParamStr(0)) + 'temp\';
  Sleep(1);

  if not DirectoryExists(diretorio) then
    CreateDir(diretorio);

  arq     :=  idUnique(id);
  imagem  :=  diretorio + arq;
  Sleep(1);

  if ADescriptografar then
  begin
    if DownLoadInternetFile(clientUrl, imagem + '.enc') then
    begin     
      if FileExists(imagem  + '.enc') then
      begin
        form  :=  format('--in %s.enc --out %s.%s --key %s',  [imagem,  imagem, tipo, mediakey]);
        shell(form);
        Sleep(10);
        Result:= imagem + '.' + tipo;
      end;
    end;
  end else
  begin
    if DownLoadInternetFile(clientUrl, imagem + '.' + tipo) then
    begin
      if FileExists(imagem + '.' + tipo) then  
        result:= imagem  + '.' + tipo;      
    end;
  end;
end;

function TWPPConnectDecryptFile.shell(program_path: string): string;
var
  s1: string;
begin
  s1 := ExtractFilePath(Application.ExeName)+'decryptFile.dll ';
  ShellExecute(0, nil, 'cmd.exe', PChar('/c '+ s1 + program_path ), PChar(s1 + program_path), SW_HIDE);
end;

end.
