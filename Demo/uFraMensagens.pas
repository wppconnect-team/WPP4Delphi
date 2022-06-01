unit uFraMensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.ComCtrls;

type
  TframeMensagem = class(TFrame)
    GroupBox1: TGroupBox;
    ed_num: TLabeledEdit;
    mem_message: TMemo;
    Label1: TLabel;
    edtURL: TLabeledEdit;
    gbAcoesBasicas: TGroupBox;
    btnLocalizacaoBotao: TBitBtn;
    btnLink: TBitBtn;
    btnImagemBotao: TBitBtn;
    btnImagem: TBitBtn;
    btnVideoBotao: TBitBtn;
    btnVideo: TBitBtn;
    btnListaMenu: TBitBtn;
    btnBotaoSimples: TBitBtn;
    btnTextoSimples: TBitBtn;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    btnAudio: TBitBtn;
    btnContato: TBitBtn;
    btnSticker: TBitBtn;
    btnLocalizacao: TBitBtn;
    ImageList1: TImageList;
    btnLimparConversa: TBitBtn;
    btnArquivar: TBitBtn;
    btnResponder: TBitBtn;
    btnReagir: TBitBtn;
    btnVerificarNumero: TBitBtn;
    btnStatus: TBitBtn;
    btnDetalhe: TBitBtn;
    groupListaContatos: TGroupBox;
    Panel4: TPanel;
    btnListarCOntatos: TButton;
    listaContatos: TListView;
    groupListaChats: TGroupBox;
    btnListarChats: TButton;
    listaChats: TListView;
    btnBloquear: TBitBtn;
    btnDesbloquear: TBitBtn;
    btnFixarChat: TBitBtn;
    btnDesfixarChat: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure edtURLDblClick(Sender: TObject);
    procedure btnTextoSimplesClick(Sender: TObject);
    procedure btnBotaoSimplesClick(Sender: TObject);
    procedure btnListaMenuClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnVideoBotaoClick(Sender: TObject);
    procedure btnImagemClick(Sender: TObject);
    procedure btnImagemBotaoClick(Sender: TObject);
    procedure btnLinkClick(Sender: TObject);
    procedure btnAudioClick(Sender: TObject);
    procedure btnStickerClick(Sender: TObject);
    procedure btnContatoClick(Sender: TObject);
    procedure btnLocalizacaoClick(Sender: TObject);
    procedure btnLocalizacaoBotaoClick(Sender: TObject);
    procedure btnReagirClick(Sender: TObject);
    procedure btnResponderClick(Sender: TObject);
    procedure btnLimparConversaClick(Sender: TObject);
    procedure btnVerificarNumeroClick(Sender: TObject);
    procedure btnStatusClick(Sender: TObject);
    procedure btnDetalheClick(Sender: TObject);
    procedure btnListarCOntatosClick(Sender: TObject);
    procedure btnBloquearClick(Sender: TObject);
    procedure btnDesbloquearClick(Sender: TObject);
    procedure btnArquivarClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnFixarChatClick(Sender: TObject);
    procedure btnDesfixarChatClick(Sender: TObject);
    procedure btnListarChatsClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure listaChatsDblClick(Sender: TObject);
    procedure listaContatosDblClick(Sender: TObject);
  private
    { Private declarations }
     FStatus: Boolean;
  public
    { Public declarations }
  end;

implementation

uses
  Winapi.ShellAPI, uFrDemo, uTWPPConnect.Emoticons;

{$R *.dfm}

procedure TframeMensagem.BitBtn1Click(Sender: TObject);
begin
  if ed_Num.Text = '' then
  begin
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Contato para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;
  end;

  if not frDemo.TWPPConnect1.Auth then
    Exit;
  frDemo.TWPPConnect1.DesarquivarChat(ed_num.text);
end;

procedure TframeMensagem.BitBtn2Click(Sender: TObject);
var
  IdMensagem: string;
begin


  if InputQuery('Informe a ID da Mensagem.', 'Unique ID: ', IdMensagem) then
  begin

    frDemo.TWPPConnect1.getMessageById(IdMensagem);
  end;
end;

procedure TframeMensagem.btnArquivarClick(Sender: TObject);
begin
  if ed_Num.Text = '' then
  begin
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Contato para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;
  end;

   if not frDemo.TWPPConnect1.Auth then
      Exit;
  frDemo.TWPPConnect1.ArquivarChat(ed_num.text);
end;

procedure TframeMensagem.btnAudioClick(Sender: TObject);
var
  content, options, options_Figurinha, options_Imagem, options_Audio,
    description, buttontext, menu, menu2, menu3 : string;
  LBase64 : TStringList;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
      Exit;

    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Audio.txt');

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      options :=
        'createChat: true, ' +
        'useTemplateButtons: true, ' +
        'title: "Novidades",  ' +
        'footer: "Imagem com Botão",  ' +
        'buttons: [ ' +
        '  { ' +
        '    url: "https://wppconnect-team.github.io/", ' +
        '    text: "Acesse Nosso Site" ' +
        '  }, ' +
        '{phoneNumber: "551734265560", text: "☎️ Qualquer Dúvida Ligue"},' +
        '  { ' +
        '    id: "001",  ' +
        '    text: "Show de Bola"  ' +
        '  },  ' +
        '  {  ' +
        '    id: "002",  ' +
        '    text: "Curti"  ' +
        '  }  ' +
        ']  ';

      options_Figurinha := 'type: "sticker"';

      options_Imagem :=
         '  type: "image", ' +
         '  caption: "My image",  ' +
         '  isViewOnce: true  '; //Temporaria Somente 1 Visualização

      //Imagem com Temporaria Somente 1 Visualização
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Imagem, '');

      //Audio
      frDemo.TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Audio, '');

      //Botões IMAGEM
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Botões VIDEO
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Figurinha Stickers
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Figurinha, '');
    FINALLY
      freeAndNil(LBase64);
    END;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnBloquearClick(Sender: TObject);
begin
  if ed_Num.Text = '' then
  begin
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Contato para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;
  end;

   if not frDemo.TWPPConnect1.Auth then
      Exit;
  frDemo.TWPPConnect1.BloquearContato(ed_num.text);
end;

procedure TframeMensagem.btnBotaoSimplesClick(Sender: TObject);
var
  S_RETORNO, options : wideString;
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
      Exit;


    options :=
      'useTemplateButtons: true,' +
      'createChat: true,' +
      'buttons:' +
      '['+
        '{url: "https://wppconnect-team.github.io/", text: "🌐️ Acesse Nosso Site"},' +
        '{phoneNumber: "551734265560", text: "☎️ Qualquer Dúvida Ligue"},' +
        '{id: "idVISITASIM", text: "Sim"},' +
        '{id: "idVISITANAO", text: "Não"}' +
      ']' +
      ',footer: "Escolha uma Opção"';

    S_RETORNO := TWPPConnectEmoticons.robot + ' *Confirma Visita do Nosso Técnico?* ' + '\n';

    frDemo.TWPPConnect1.SendButtons(ed_num.Text, S_RETORNO, options, '');

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnContatoClick(Sender: TObject);
begin
 try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if Trim(mem_message.Text) = '' then
    begin
      messageDlg('Informe o Número do Contato para Continuar', mtWarning, [mbOk], 0);
      mem_message.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
       Exit;
    //               Dest                    Contact
    //               ex: 558199301443@c.us   558187576958@c.us
    frDemo.TWPPConnect1.sendContact(ed_num.Text,        mem_message.Text);
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnDesbloquearClick(Sender: TObject);
begin
 if ed_Num.Text = '' then
  begin
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Contato para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;
  end;

   if not frDemo.TWPPConnect1.Auth then
      Exit;
  frDemo.TWPPConnect1.DesbloquearContato(ed_num.text);
end;

procedure TframeMensagem.btnDesfixarChatClick(Sender: TObject);
begin
  if ed_Num.Text = '' then
  begin
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Contato para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;
  end;

   if not frDemo.TWPPConnect1.Auth then
      Exit;
  frDemo.TWPPConnect1.DesfixarCHat(ed_num.text);
end;

procedure TframeMensagem.btnDetalheClick(Sender: TObject);
begin

  try
    if not frDemo.TWPPConnect1.Auth then
       Exit;

    frDemo.TWPPConnect1.GetMe();
  finally

  end;
end;

procedure TframeMensagem.btnFixarChatClick(Sender: TObject);
begin
  if ed_Num.Text = '' then
  begin
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Contato para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;
  end;

   if not frDemo.TWPPConnect1.Auth then
      Exit;
  frDemo.TWPPConnect1.FixarChat(ed_num.text);
end;

procedure TframeMensagem.btnImagemBotaoClick(Sender: TObject);
var
  content, options, options_Figurinha, options_Imagem, options_Audio,
    description, buttontext, menu, menu2, menu3 : string;
  LBase64 : TStringList;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
      Exit;

    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt');

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      options :=
        'createChat: true, ' +
        'useTemplateButtons: true, ' +
        'title: "Novidades",  ' +
        'footer: "Imagem com Botão",  ' +
        'buttons: [ ' +
        '  { ' +
        '    url: "https://wppconnect-team.github.io/", ' +
        '    text: "Acesse Nosso Site" ' +
        '  }, ' +
        '{phoneNumber: "551734265560", text: "☎️ Qualquer Dúvida Ligue"},' +
        '  { ' +
        '    id: "001",  ' +
        '    text: "Show de Bola"  ' +
        '  },  ' +
        '  {  ' +
        '    id: "002",  ' +
        '    text: "Curti"  ' +
        '  }  ' +
        ']  ';

      options_Figurinha := 'type: "sticker"';

      options_Imagem :=
         '  type: "image", ' +
         '  caption: "My image",  ' +
         '  isViewOnce: true  '; //Temporaria Somente 1 Visualização

      //Imagem com Temporaria Somente 1 Visualização
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Imagem, '');

      //Audio
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Audio, '');

      //Botões IMAGEM
      frDemo.TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Botões VIDEO
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Figurinha Stickers
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Figurinha, '');
    FINALLY
      freeAndNil(LBase64);
    END;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;

end;

procedure TframeMensagem.btnImagemClick(Sender: TObject);
var
  content, description, buttontext, menu, menu2, menu3 : string;
  LBase64 : TStringList;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
      Exit;

    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt');

      content := mem_message.Text;

      //Botões IMAGEM
      frDemo.TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, '', '');


    FINALLY
      freeAndNil(LBase64);
    END;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnLimparConversaClick(Sender: TObject);
begin
 if not frDemo.TWPPConnect1.Auth then

     Exit;

  frDemo.TWPPConnect1.CleanALLChat(ed_num.Text);
end;

procedure TframeMensagem.btnLinkClick(Sender: TObject);
 var
  options: string;
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
      Exit;

    options :=
      'linkPreview: { ' +
      'title: "WPPConnect", ' +
      'description: "WPPConnect/WA-JS" }';

    frDemo.TWPPConnect1.sendLinkPreview(ed_num.text, edtUrl.text, options);

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnListaMenuClick(Sender: TObject);
var
  titleText, subtitleText, description, buttontext, menu, menu2, menu3 : string;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
      Exit;

    titleText := 'Forma de Pagamento';
    subtitleText := 'Selecione um item, por favor';


    buttontext := 'buttonText:"Opcoes"';
    description := 'description:"Como deseja pagar pelo servico"';


    menu2 := '[{title:"sectionTitle",rows:[{title:"ListItem1",description:"desc"},{title:"ListItem2",description:"desc2"}]}]';
    //menu := ' ';
    menu :=
      'buttonText:"Formas de Pagamento",' +
      'description:"Como deseja pagar pelo servico",' +
      'sections:'+
      '[' +
      '{ title: "Na Hora", rows: [{ rowId: "idDinheiro", title: "\💵 Dinheiro", description: "Receber no local." }]},' +
      '{ title: "On-line", rows: [{ rowId: "idFormas", title: "\💱 Pix", description: "Chave: 123456789"},' +
        '{ title: "1 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "2 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "3 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "4 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "5 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "6 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "7 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "8 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "9 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ title: "10 Cartao Credito", description: "Pode parcelar em ate 12x"},' +
        '{ title: "11 Cartao Credito", description: "Pode parcelar em ate 12x"},' +
        '{ title: "12 Cartao Credito", description: "Pode parcelar em ate 12x"}' +
      ']' +
      '}]';

    menu3 :=
      'buttonText:"Opcoes",' +
      'description:"Como deseja pagar pelo servico",' +
      'sections:'+
      '[{ ' +
      '    title: "Section 1",' +
      '    rows: [{' +
      '        rowId: "rowid1", ' +
      '        title: "Row 1", ' +
      '        description: "Hello its description 1", ' +
      '    }, { ' +
      '        rowId: "rowid2", ' +
      '        title: "Row 2", ' +
      '        description: "Hello its description 2", ' +
      '    }] ' +
      '}] ';


    //TWPPConnect.SendListMenu(ed_num.text, titleText, subtitleText, description, ButtonText, menu, '');
    frDemo.TWPPConnect1.SendListMessage(ed_num.text, ButtonText, description, menu, '');

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnLocalizacaoBotaoClick(Sender: TObject);
var
  options : string;
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
      Exit;

    options :=
      'lat: -22.95201, ' +
      'lng: -43.2102601, ' +
      'name: "Cristo Rendentor", ' +
      'address: "Parque Nacional da Tijuca - Alto da Boa Vista, Rio de Janeiro - RJ", ' +
      'url: "https://santuariocristoredentor.com.br/", ' +
      'useTemplateButtons: true, ' +
      'createChat: true, ' +
      'title: "Cristo Rendentor",  ' +
      'footer: "Pacote de Viagem",  ' +
      'buttons: [ ' +
      '  { ' +
      '    url: "https://www.cvc.com.br/destinos/rio-de-janeiro-brasil", ' +
      '    text: "Compre o Pacote de Viagem" ' +
      '  }, ' +
      '{phoneNumber: "5517981388414", text: "☎️ Qualquer Dúvida Ligue"},' +
      '  { ' +
      '    id: "001",  ' +
      '    text: "Quero Conhecer"  ' +
      '  },  ' +
      '  {  ' +
      '    id: "002",  ' +
      '    text: "Curti"  ' +
      '  }  ' +
      ']  ';

    frDemo.TWPPConnect1.SendLocationMessage(ed_num.text, options, '');

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnLocalizacaoClick(Sender: TObject);
var
  options : string;
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
      Exit;

    options :=
      'lat: -22.95201, ' +
      'lng: -43.2102601, ' +
      'name: "Cristo Rendentor", ' +
      'address: "Parque Nacional da Tijuca - Alto da Boa Vista, Rio de Janeiro - RJ"W';

    frDemo.TWPPConnect1.SendLocationMessage(ed_num.text, options, '');

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnReagirClick(Sender: TObject);
var
  reaction, IdMensagem: string;
begin
  reaction := '"' + TWPPConnectEmoticons.Corarao + '"';

  if InputQuery('Informe a ID da Mensagem.', 'Unique ID: ', IdMensagem) then
  begin

    frDemo.TWPPConnect1.SendReactionMessage(IdMensagem, reaction);
  end;
end;

procedure TframeMensagem.btnResponderClick(Sender: TObject);
var
  option, content, IdMensagem: string;
begin
  content := '';
  IdMensagem := '';
  option := '';

  if InputQuery('Informe a ID da Mensagem.', 'Unique ID: ', IdMensagem) then
  begin
    if InputQuery('Informe Sua Resposta.', 'Resposta: ', content) then
    begin
      option := 'quotedMsg: "' + IdMensagem+ '"';
      frDemo.TWPPConnect1.SendTextMessage(ed_num.text, content, option);
    end;
  end;

end;

procedure TframeMensagem.btnStatusClick(Sender: TObject);
begin
 try

    FStatus := true;
    if not frDemo.TWPPConnect1.Auth then
       Exit;

   frDemo.TWPPConnect1.GetStatusContact(ed_num.Text);
  finally

  end;
end;

procedure TframeMensagem.btnStickerClick(Sender: TObject);
var
  content, options, options_Figurinha, options_Imagem, options_Audio,
    description, buttontext, menu, menu2, menu3 : string;
  LBase64 : TStringList;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
      Exit;
    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt');

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      options :=
        'createChat: true, ' +
        'useTemplateButtons: true, ' +
        'title: "Novidades",  ' +
        'footer: "Imagem com Botão",  ' +
        'buttons: [ ' +
        '  { ' +
        '    url: "https://wppconnect-team.github.io/", ' +
        '    text: "Acesse Nosso Site" ' +
        '  }, ' +
        '{phoneNumber: "551734265560", text: "☎️ Qualquer Dúvida Ligue"},' +
        '  { ' +
        '    id: "001",  ' +
        '    text: "Show de Bola"  ' +
        '  },  ' +
        '  {  ' +
        '    id: "002",  ' +
        '    text: "Curti"  ' +
        '  }  ' +
        ']  ';

      options_Figurinha := 'type: "sticker"';

      options_Imagem :=
         '  type: "image", ' +
         '  caption: "My image",  ' +
         '  isViewOnce: true  '; //Temporaria Somente 1 Visualização

      //Imagem com Temporaria Somente 1 Visualização
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Imagem, '');

      //Audio
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Audio, '');

      //Botões IMAGEM
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Botões VIDEO
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Figurinha Stickers
      frDemo.TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Figurinha, '');
    FINALLY
      freeAndNil(LBase64);
    END;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnTextoSimplesClick(Sender: TObject);
var
  options : string;
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if Trim(mem_message.Text) = '' then
    begin
      messageDlg('Informe o Texto da Mensagem para Continuar', mtWarning, [mbOk], 0);
      mem_message.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
       Exit;

    options := '';

    frDemo.TWPPConnect1.SendTextMessage(ed_num.Text, mem_message.Text, options);
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnVerificarNumeroClick(Sender: TObject);
begin
 if not frDemo.TWPPConnect1.Auth then
   Exit;

  frDemo.TWPPConnect1.NewCheckIsValidNumber('5517981388414@c.us');
end;

procedure TframeMensagem.btnVideoBotaoClick(Sender: TObject);
var
  content, options, options_Figurinha, options_Imagem, options_Audio,
    description, buttontext, menu, menu2, menu3 : string;
  LBase64 : TStringList;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
      Exit;
    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\base64Videos2.txt');

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      options :=
        'createChat: true, ' +
        'useTemplateButtons: true, ' +
        'title: "Novidades",  ' +
        'footer: "Video com Botão",  ' +
        'buttons: [ ' +
        '  { ' +
        '    url: "https://wppconnect-team.github.io/", ' +
        '    text: "Acesse Nosso Site" ' +
        '  }, ' +
        '{phoneNumber: "5517981388414", text: "☎️ Qualquer Dúvida Ligue"},' +
        '  { ' +
        '    id: "001",  ' +
        '    text: "Show de Bola"  ' +
        '  },  ' +
        '  {  ' +
        '    id: "002",  ' +
        '    text: "Curti"  ' +
        '  }  ' +
        ']  ';

      options_Figurinha := 'type: "sticker"';

      options_Imagem :=
         '  type: "image", ' +
         '  caption: "My image",  ' +
         '  isViewOnce: true  '; //Temporaria Somente 1 Visualização

      //Imagem com Temporaria Somente 1 Visualização
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Imagem, '');

      //Audio
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Audio, '');

      //Botões IMAGEM
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Botões VIDEO
      frDemo.TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Figurinha Stickers
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Figurinha, '');
    FINALLY
      freeAndNil(LBase64);
    END;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnVideoClick(Sender: TObject);
var
  content, options, options_Figurinha, options_Imagem, options_Audio,
    description, buttontext, menu, menu2, menu3 : string;
  LBase64 : TStringList;
begin

  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;

    if not frDemo.TWPPConnect1.Auth then
      Exit;
    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\base64Videos2.txt');

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      options :=
        'createChat: true, ' +
        'useTemplateButtons: true, ' +
        'title: "Novidades",  ' +
        'footer: "Video com Botão",  ' +
        'buttons: [ ' +
        '  { ' +
        '    url: "https://wppconnect-team.github.io/", ' +
        '    text: "Acesse Nosso Site" ' +
        '  }, ' +
        '{phoneNumber: "5517981388414", text: "☎️ Qualquer Dúvida Ligue"},' +
        '  { ' +
        '    id: "001",  ' +
        '    text: "Show de Bola"  ' +
        '  },  ' +
        '  {  ' +
        '    id: "002",  ' +
        '    text: "Curti"  ' +
        '  }  ' +
        ']  ';

      options_Figurinha := 'type: "sticker"';

      options_Imagem :=
         '  type: "image", ' +
         '  caption: "My image",  ' +
         '  isViewOnce: true  '; //Temporaria Somente 1 Visualização

      //Imagem com Temporaria Somente 1 Visualização
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Imagem, '');

      //Audio
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Audio, '');

      //Botões IMAGEM
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Botões VIDEO
      frDemo.TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');

      //Figurinha Stickers
      //TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Figurinha, '');
    FINALLY
      freeAndNil(LBase64);
    END;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnListarChatsClick(Sender: TObject);
begin
  frDemo.TWPPConnect1.GetAllChats;
end;

procedure TframeMensagem.btnListarCOntatosClick(Sender: TObject);
begin
  frDemo.TWPPConnect1.getAllContacts;
end;

procedure TframeMensagem.edtURLDblClick(Sender: TObject);
begin
  if edtURL.Text <> '' then
    ShellExecute(Self.Handle,'open', pchar(edtUrl.Text),'','',SW_SHOWNORMAL);
end;

procedure TframeMensagem.listaChatsDblClick(Sender: TObject);
begin
  ed_num.text := frDemo.TWPPConnect1.GetChat(listaChats.Selected.Index).id;
end;

procedure TframeMensagem.listaContatosDblClick(Sender: TObject);
begin
  ed_num.text := copy(listaContatos.Items[listaContatos.Selected.Index].SubItems
    [1], 0, pos('@', listaContatos.Items[listaContatos.Selected.Index].SubItems
    [1])) + 'c.us';
end;

end.
