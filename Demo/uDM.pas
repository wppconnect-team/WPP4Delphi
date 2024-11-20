unit uDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.SQLite,
  FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait, FireDAC.Comp.UI, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet;

type
  Tdm = class(TDataModule)
    sqlSearch: TFDQuery;
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    sqlPost: TFDQuery;
    sqlTicket: TFDQuery;
    procedure FDConnection1BeforeConnect(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure Tdm.FDConnection1BeforeConnect(Sender: TObject);
var
  Query: TFDQuery;
begin
  // Defina o nome do arquivo da base de dados
{  FDConnection1.Params.Values['Database'] := 'database.db';
  FDConnection1.Params.Values['DriverID'] := 'SQLite';
  FDConnection1.Params.Values['CharacterSet'] := 'UTF8';

  // Verifica se o arquivo da base de dados não existe
  if not FileExists('database.db') then
  begin
    // Abre a conexão
    //FDConnection1.Connected := True;

    // Cria um objeto de consulta
    Query := TFDQuery.Create(nil);
    try
      Query.Connection := FDConnection1;

      // Comando SQL para criar a tabela 'ticket'
      Query.SQL.Text :=
        'CREATE TABLE IF NOT EXISTS ticket (' +
        'id INTEGER PRIMARY KEY AUTOINCREMENT, ' +
        'namecontact VARCHAR(100), ' +
        'situacion INTEGER, ' +
        'number VARCHAR(50), ' +
        'sessionid VARCHAR(100)' +
        ');';

      // Executa o comando
      Query.ExecSQL;
    finally
      Query.Free;
    end;
  end;
 }

end;

end.
