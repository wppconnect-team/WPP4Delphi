unit uSplash;

interface

uses   ToolsAPI,DesignIntf, DesignEditors,SysUtils,
  Windows,
  Classes;

 procedure AddLogoToSplashIDE;


const
  LOGO_BASE64 = 'Qk3WAQAAAAAAADYAAAAoAAAAEQAAAAgAAAABABgAAAAAAKABAADEDg'+
'AAxA4AAAAAAAAAAAAA////pdCf8/nzyuPHyePF6/Xq2ezW7PXq4vDhyuTG3e3auty3////ptGg9f'+
'r01unT////AMbhwtTo0d7t3JrKkZ3NlcLgvGKuVd3t2liqS5fIjqHQmcTfwcPgv9Xp0eLw4JfIj/'+
'///wD////C373////d7dvr9Or6/Pnz+PL5+/j0+fPy+PHp9Oe427L////F4cH///+y2Kze7dsA//'+
'//msyQarNb////K5QW1+vS/////P77PJ0p////////////////QZ8v+/37////////AP///06lOz'+
'qbJv///xOIAIjDfP////j7+CiTEvr8+f///////////zSZH9rs1v7+/v///wD///8xlhx5u2qezZ'+
'OazJFFoDH////7/fsbjAOBwHMijwz8/fv///89nSp0uWUxlx3E4b4A1+rUV6pHzOXHAHkA////II'+
'8J////+Pz4JZIP////KpQV2+zY////K5QW/P38icN+h8N8ANnp1sXiv////4XBef///6PRmvr8+v'+
'///4vFf3K4ZLLYqv///////7LYqnO5ZYzFgf///wA=';

implementation

{ TSplashScreen }

procedure AddLogoToSplashIDE;
var
  LBitMap: HBITMAP;
begin
  ForceDemandLoadState(dlDisable);
  if Assigned(SplashScreenServices) then
  begin
    LBitMap := LoadBitmap(FindResourceHInstance(HInstance), 'TWPPBMP');
    try
      SplashScreenServices.AddPluginBitmap('WPPConnect-team', LBitMap, False, 'WPP4Delphi');
    finally
      DeleteObject(LBitMap);
    end;
  end;
end;

initialization
AddLogoToSplashIDE;

end.
