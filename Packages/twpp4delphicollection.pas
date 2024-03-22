{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit TWPP4DelphiCollection;

{$warn 5023 off : no warning about unused units}
interface

uses
  uTWPPConnect, uTWPPConnect.languages, uTWPPConnect.ConfigCEF, UBase64, 
  uCSV.Import, uTWPPConnect.AdjustNumber, uTWPPConnect.ChatList, 
  uTWPPConnect.Classes, uTWPPConnect.Config, uTWPPConnect.Constant, 
  uTWPPConnect.Diversos, uTWPPConnect.Emoticons, uTWPPConnect.ExePath, 
  uTWPPConnect.JS, uWPPConnectDecryptFile, uTWPPConnect.Console, 
  uTWPPConnect.FrmConfigNetWork, uTWPPConnect.FrmQRCode, LazarusPackageIntf;

implementation

procedure Register;
begin
end;

initialization
  RegisterPackage('TWPP4DelphiCollection', @Register);
end.
