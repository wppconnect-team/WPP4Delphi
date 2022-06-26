unit uFraCatalogo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.StdCtrls,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls,
  Vcl.DBCGrids;

type
  TframeCatalogo = class(TFrame)
    pnlGridCatalogo: TPanel;
    DBGrid1: TDBGrid;
    Button1: TButton;
    dsCatalogo: TDataSource;
    cdsCatalogo: TClientDataSet;
    gbOpcoesCatalogo: TGroupBox;
    GroupBox1: TGroupBox;
    DBCtrlGrid1: TDBCtrlGrid;
    DBImage1: TDBImage;
    dsImagens: TDataSource;
    cdsImagens: TClientDataSet;
    cdsImagensid: TStringField;
    cdsImagensimagem: TBlobField;
    cdsCatalogoid: TStringField;
    cdsCatalogoisHidden: TBooleanField;
    cdsCatalogocatalogWid: TStringField;
    cdsCatalogourl: TStringField;
    cdsCatalogoname: TStringField;
    cdsCatalogodescription: TStringField;
    cdsCatalogoavailability: TStringField;
    cdsCatalogoreviewStatus: TStringField;
    cdsCatalogocanAppeal: TBooleanField;
    cdsCatalogocurrency: TStringField;
    cdsCatalogopriceAmount1000: TCurrencyField;
    cdsCatalogosalePriceAmount1000: TCurrencyField;
    cdsCatalogosalePriceStartDate: TStringField;
    cdsCatalogosalePriceEndDate: TStringField;
    cdsCatalogoretailerId: TStringField;
    cdsCatalogoimageCount: TIntegerField;
    cdsCatalogoindex: TStringField;
    cdsCatalogoadditionalImageCdnUrl: TStringField;
    cdsCatalogoadditionalImageHashes: TStringField;
    cdsCatalogoimageCdnUrl: TStringField;
    cdsCatalogoimageHash: TStringField;
    cdsCatalogot: TStringField;
    cdsCatalogoimagemProduto: TBlobField;
    procedure Button1Click(Sender: TObject);
    procedure cdsCatalogoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure BaixarImagens;
  end;

implementation

{$R *.dfm}

uses uFrDemo, uWPPConnectDecryptFile;

procedure TframeCatalogo.BaixarImagens;
var
  WPPConnectDecrypt: TWPPConnectDecryptFile;
  LDiretorioImg: String;
  LListaImagens: TStringList;
  LListaHashes: TStringList;
  i: Integer;
begin
  cdsImagens.EmptyDataSet;
  if cdsCatalogo.RecordCount = 0 then
    exit;
  try
    cdsCatalogo.First;
    while not cdsCatalogo.Eof do
    begin
      LDiretorioImg := WPPConnectDecrypt.download
        (cdsCatalogoimageCdnUrl.AsString, cdsCatalogoimageHash.AsString, 'jpg',
        cdsCatalogoid.AsString, false);
      if LDiretorioImg <> '' then
      begin
        cdsImagens.Append;
        cdsImagensid.AsString := cdsCatalogoid.AsString;
        cdsImagensimagem.LoadFromFile(LDiretorioImg);
        cdsImagens.Post;

      end;

      if (cdsCatalogoimageCount.AsInteger > 0) and
        (cdsCatalogoadditionalImageCdnUrl.AsString <> '') then
      begin
        try
          LListaImagens := TStringList.Create;
          LListaHashes := TStringList.Create;
          LListaHashes.Delimiter := ';';
          LListaImagens.Delimiter := ';';
          LListaImagens.DelimitedText :=
            cdsCatalogoadditionalImageCdnUrl.AsString;
          LListaHashes.DelimitedText :=
            cdsCatalogoadditionalImageHashes.AsString;

          if LListaImagens.Count > 0 then
          begin

            for i := 0 to LListaImagens.Count - 1 do
            begin
              if LListaImagens[i] = '' then
                continue;

              LDiretorioImg := WPPConnectDecrypt.download(LListaImagens[i],
                LListaHashes[i], 'jpg', cdsCatalogoid.AsString, false);
              if LDiretorioImg <> '' then
              begin
                cdsImagens.Append;
                cdsImagensid.AsString := cdsCatalogoid.AsString;
                cdsImagensimagem.LoadFromFile(LDiretorioImg);
                cdsImagens.Post;
                sleep(100);
                application.ProcessMessages;
              end;
            end;
          end;
        finally
          LListaImagens.Free;
          LListaHashes.Free;
        end;
      end;
      cdsCatalogo.Next;
    end;
  except
    // pra evitar jpeg error por causa do componente do delphi
  end;
end;

procedure TframeCatalogo.Button1Click(Sender: TObject);
begin
  frDemo.TWPPConnect1.GetProductCatalog;
end;

procedure TframeCatalogo.cdsCatalogoAfterScroll(DataSet: TDataSet);
begin
  cdsImagens.Filter := 'id = ' + cdsCatalogoid.AsString.QuotedString;
end;

end.
