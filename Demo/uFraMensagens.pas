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

unit uFraMensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, System.ImageList, Vcl.ImgList, Vcl.ComCtrls, uTWPPConnect.Constant ,
  EncdDecd, System.NetEncoding, Vcl.Imaging.jpeg, System.TypInfo, System.DateUtils;

type
  TframeMensagem = class(TFrame)
    GroupBox1: TGroupBox;
    ed_num: TLabeledEdit;
    mem_message: TMemo;
    Label1: TLabel;
    edtURL: TLabeledEdit;
    gbAcoesBasicas: TGroupBox;
    btnLocalizacaoBotao: TButton;
    btnLink: TButton;
    btnImagemBotao: TButton;
    btnImagem: TButton;
    btnInstantVideo: TButton;
    btnVideo: TButton;
    btnListaMenu: TButton;
    btnBotaoSimples: TButton;
    btnTextoSimples: TButton;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    btnAudio: TButton;
    btnContato: TButton;
    btnSticker: TButton;
    btnLocalizacao: TButton;
    ImageList1: TImageList;
    btnLimparConversa: TButton;
    btnArquivar: TButton;
    btnResponder: TButton;
    btnReagir: TButton;
    btnVerificarNumero: TButton;
    btnStatus: TButton;
    btnDetalhe: TButton;
    groupListaContatos: TGroupBox;
    Panel4: TPanel;
    btnListarCOntatos: TButton;
    listaContatos: TListView;
    groupListaChats: TGroupBox;
    btnListarChats: TButton;
    listaChats: TListView;
    btnBloquear: TButton;
    btnDesbloquear: TButton;
    btnFixarChat: TButton;
    btnDesfixarChat: TButton;
    BitBtn1: TButton;
    BitBtn2: TButton;
    btnArquivarTodosChats: TButton;
    btnDeletarTodosChats: TButton;
    OpenDialog1: TOpenDialog;
    btnArquivo: TButton;
    btnStatusTexto: TButton;
    btnStatusImagem: TButton;
    btnVideoStatus: TButton;
    PageControl1: TPageControl;
    tsImage: TTabSheet;
    Image1: TImage;
    tsBase64: TTabSheet;
    Memo1: TMemo;
    lblCaminhoImagem: TLabel;
    Button1: TButton;
    btnValidarListarNumeros: TButton;
    btnGetMessage: TButton;
    Button2: TButton;
    bTextoMarcandoTodosGrupo: TButton;
    Button3: TButton;
    Button4: TButton;
    btnLigar: TButton;
    btnEncerrarChamada: TButton;
    eChoicesPool: TEdit;
    Label2: TLabel;
    bEditMessage: TButton;
    btnDeletarOldChat: TButton;
    bGetMe: TButton;
    bGetMensagem: TButton;
    procedure edtURLDblClick(Sender: TObject);
    procedure btnTextoSimplesClick(Sender: TObject);
    procedure btnBotaoSimplesClick(Sender: TObject);
    procedure btnListaMenuClick(Sender: TObject);
    procedure btnVideoClick(Sender: TObject);
    procedure btnInstantVideoClick(Sender: TObject);
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
    procedure btnArquivarTodosChatsClick(Sender: TObject);
    procedure btnDeletarTodosChatsClick(Sender: TObject);
    procedure btnArquivoClick(Sender: TObject);
    procedure btnStatusTextoClick(Sender: TObject);
    procedure btnStatusImagemClick(Sender: TObject);
    procedure btnVideoStatusClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnValidarListarNumerosClick(Sender: TObject);
    procedure btnGetMessageClick(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure bTextoMarcandoTodosGrupoClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure btnLigarClick(Sender: TObject);
    procedure btnEncerrarChamadaClick(Sender: TObject);
    procedure bEditMessageClick(Sender: TObject);
    procedure btnDeletarOldChatClick(Sender: TObject);
    procedure bGetMeClick(Sender: TObject);
    procedure bGetMensagemClick(Sender: TObject);
  private
    { Private declarations }
     FStatus: Boolean;
    function StrExtFile_Base64Type(PFileName: String): String;
  public
    { Public declarations }
    function EncodeString(const Input: string): string;
    function DecodeString(const Input: string): string;
    procedure Base64ToImage (str64 : string ; ImageExibicao : TImage);
    function ImageToBase64 (ImageExibicao : TImage) : String   ;
    function FileToBase64 (const AInFileName, AOutFileName: string) : string  ;
  end;

  type
    TExt_Image       = (Tsf_Jpg=0, Tsf_Jpeg=1, Tsf_Tif=2, Tsf_Ico=3, Tsf_Bmp=4, Tsf_Png=5, Tsf_Raw=6, Tsf_WebP=7);


implementation

uses
  Winapi.ShellAPI, uFrDemo, uTWPPConnect.Emoticons;

{$R *.dfm}

procedure TframeMensagem.Base64ToImage(str64: string; ImageExibicao: TImage);
var
  LInput: TMemoryStream;
  LOutput: TMemoryStream;
  ImageJPG: TJPEGImage;  //uses Vcl.Imaging.jpeg
begin
  lInput := TStringStream.Create(str64, TEncoding.ASCII);
  lOutput := TMemoryStream.Create;
  try
    lInput.Position := 0;
    TNetEncoding.Base64.Decode(lInput, lOutput);
    lOutput.Position := 0;
    ImageExibicao.Picture.LoadFromStream(lOutput);
    ImageExibicao.Repaint;
    ImageExibicao.Refresh;
  finally
    lInput.Free;
    lOutput.Free;
  end;

end;

procedure TframeMensagem.bEditMessageClick(Sender: TObject);
var
  option, content, IdMensagem: string;
begin
  content := '';
  IdMensagem := '';
  option := '';

  if InputQuery('Informe a ID da Mensagem que Deseja Editar.', 'Unique ID: ', IdMensagem) then
  begin
    if InputQuery('Informe a Nova Mensagem.', 'New Message: ', content) then
    begin
      frDemo.TWPPConnect1.editMessage(IdMensagem, content, option);
    end;
  end;

end;

procedure TframeMensagem.bGetMeClick(Sender: TObject);
begin
  try
   if not frDemo.TWPPConnect1.Auth then
     Exit;

    frDemo.TWPPConnect1.GetMe;
  finally
  end;
end;

procedure TframeMensagem.bGetMensagemClick(Sender: TObject);
var
 options: string;
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

  //https://wppconnect.io/wa-js/functions/chat.getMessages.html
  options := 'count: -1'; //All messages

  frDemo.TWPPConnect1.getMessage(ed_num.text, options);
end;

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

procedure TframeMensagem.bTextoMarcandoTodosGrupoClick(Sender: TObject);
var
  options, mentionedList : string;
  I: Integer;
begin
  try
    if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o id do Grupo para Continuar', mtWarning, [mbOk], 0);
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

    options := 'createChat: true';
    mentionedList := '';
    //mentionedList: ['123@c.us', '456@c.us']

    if frDemo.frameGrupos1.listaParticipantes.Items.Count = 0 then
    begin
      messageDlg('Selecione o Grupo de Onde estão os Participantes a serem Marcados nesta Mensagem para Continuar', mtWarning, [mbOk], 0);
      Exit;
    end;

    for I := 0 to frDemo.frameGrupos1.listaParticipantes.Items.Count -1 do
    begin
      //listaParticipantes
      //mentionedList := mentionedList + '"' + frDemo.frameGrupos1.listaParticipantes.Items[frDemo.frameGrupos1.listaParticipantes.Selected.Index].SubItems[1] + '"' + ',';
      mentionedList := mentionedList + '"' + Copy(frDemo.frameGrupos1.listaParticipantes.Items[I].SubItems[1],1,Pos('@', frDemo.frameGrupos1.listaParticipantes.Items[I].SubItems[1])) + 'c.us' + '"' + ',';
    end;

    mentionedList := Copy(mentionedList,1,Length(mentionedList)-1);
    mentionedList := ',mentionedList: [' + mentionedList + ']';

    options := options + mentionedList;

    //Opicional Não Utilizar para primeira mensagem, somente para contatos que já houve alguma interação
    //frDemo.TWPPConnect1.setKeepAlive('true'); //Marca como Online
    //frDemo.TWPPConnect1.markIsComposing(ed_num.Text, '5000'); //Digitando 5 Segundos
    //Sleep(5000);

    //frDemo.TWPPConnect1.SendTextMessage(ed_num.Text, mem_message.Text, options, '');
    frDemo.TWPPConnect1.SendTextMessageEx(ed_num.Text, mem_message.Text, options, '123');
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
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

procedure TframeMensagem.btnArquivarTodosChatsClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
      Exit;

   frDemo.TWPPConnect1.ArquivarTodosOsChats;
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
      //LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Audio.txt');
      if FileExists('C:\Executaveis\WPPConnectDemo\Base64Audio.txt') then
        LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Audio.txt')
      else
      begin
        {inicio - capturando arquivo mp3 e convertendo em base 64}
        OpenDialog1.Execute;
        lblCaminhoImagem.Caption := OpenDialog1.FileName;
        LBase64.text  := FileToBase64( OpenDialog1.FileName, 'audio' ) ;  //FileToBase64
        LBase64.text := StrExtFile_Base64Type( ExtractFileName(OpenDialog1.FileName) ) + LBase64.text; //add DataURI
        memo1.clear;
        memo1.Text    := LBase64.text ;
        {final - capturando arquivo mp3 e convertendo em base 64}
      end;

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      //Opicional Não Utilizar para primeira mensagem, somente para contatos que já houve alguma interação
      frDemo.TWPPConnect1.setKeepAlive('true'); //Marca como Online
      frDemo.TWPPConnect1.markmarkIsRecording(ed_num.Text, '5000'); //Gravando Audio 5 Segundos
      Sleep(5000);

      //Audio
      //frDemo.TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Audio, '');
      frDemo.TWPPConnect1.SendFileMessageEx(ed_num.text, LBase64.Text, options_Audio, '123');

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
  LDescricao: String;
  LChoices, Options: String;
begin
  if not frDemo.TWPPConnect1.Auth then
     Exit;

  LDescricao:= InputBox('Informe a descrição da votação','Descrição','Votação WPPConnect');

  if LDescricao = '' then
    exit;

  if Trim(ed_num.Text) = '' then
  begin
    messageDlg('Informe o Contato para Continuar', mtWarning, [mbOk], 0);
    ed_num.SetFocus;
    Exit;
  end;

  LChoices := '["OPÇÃO 1","OPÇÃO 2","OPÇÃO 3"]';
  //LChoices := '["Bolo","Cachorro Quente"]';

  if eChoicesPool.Text <> '' then
    LChoices := eChoicesPool.Text;

  Options := 'createchat:true, selectableCount:1'; // Apenas 1 Escolha
  //Options := 'createchat:true, selectableCount:0'; // Multipla Escolha

  //frDemo.TWPPConnect1.CreatePool(ed_num.Text, LDescricao, LChoices, Options);
  frDemo.TWPPConnect1.CreatePoolEx(ed_num.Text, LDescricao, LChoices, Options, '123', 'Enquete01');

(*var
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


    //Opicional Não Utilizar para primeira mensagem, somente para contatos que já houve alguma interação
    //frDemo.TWPPConnect1.setKeepAlive('true'); //Marca como Online
    //frDemo.TWPPConnect1.markIsComposing(ed_num.Text, '5000'); //Digitando 5 Segundos
    //Sleep(5000);

    options :=
      'useTemplateButtons: undefined,' + //Is Working Android and iOS
      //'useTemplateButtons: true,' +  //Crash iOS
      'createChat: true,' +
      'buttons:' +
      '['+
        //'{url: "https://wppconnect-team.github.io/", text: "🌐️ Acesse Nosso Site"},' + //Crash iOS
        //'{url: "https://wa.me/5517981388414", text: "Fale Conosco"}, ' +
        //'{url: "https://apoia.se/wppconnect", text: "🌐️ APOIA.se"},' + //Crash iOS
        //'{url: "https://www.whatsapp.com/otp/copy/text%20here", text: "Copy Chave Pix" }, ' +
        //'{url: "https://www.whatsapp.com/otp/copy/8e3fda51-2c8f-4134-a154-24cd02e07890", text: "Copy Chave Pix" }, ' +  //8e3fda51-2c8f-4134-a154-24cd02e07890
        //'{phoneNumber: "5517981388414", text: "☎️ Qualquer Dúvida Ligue"},' + //Crash iOS

        '{id: "idVISITASIM", text: "Sim"},' +
        '{id: "idVISITANAO", text: "Não"}' +
      ']' +
      ',footer: "Escolha uma Opção"';
      //'';

    S_RETORNO := TWPPConnectEmoticons.robot + ' *Confirma Visita do Nosso Técnico?* ' + '\n';
    //S_RETORNO := TWPPConnectEmoticons.robot + ' *Teste Botão com Função Copy* ' + '\n';

    frDemo.TWPPConnect1.SendTextMessageEx(ed_num.Text, S_RETORNO, options, '123');

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;*)
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
    //frDemo.TWPPConnect1.sendContact(ed_num.Text,        mem_message.Text);

    frDemo.TWPPConnect1.sendVCardContactMessageEx(ed_num.Text, mem_message.Text, '', '', '123');
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnDeletarTodosChatsClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  //frDemo.TWPPConnect1.DeletarTodosOsChats;
  frDemo.TWPPConnect1.DeletarTodosOsChatsUsers
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
var
  idMensagem: string;
begin
  try

    if not frDemo.TWPPConnect1.Auth then
       Exit;

    if ed_Num.Text = '' then
    begin
      if Trim(ed_num.Text) = '' then
      begin
        messageDlg('Informe o Contato para Continuar', mtWarning, [mbOk], 0);
        ed_num.SetFocus;
        Exit;
      end;
    end;

    if InputQuery('Informe a ID da Mensagem.', 'Unique ID: ', IdMensagem) then
    begin

      frDemo.TWPPConnect1.forwardMessage(ed_num.text, IdMensagem);
    end;
    //frDemo.TWPPConnect1.GetMe();
    //frDemo.TWPPConnect1.getList('');
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

procedure TframeMensagem.btnGetMessageClick(Sender: TObject);
var
  IdMensagem : string;
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


  if InputQuery('Informe a ID da Mensagem.', 'Unique ID: ', IdMensagem) then
  begin

    frDemo.TWPPConnect1.getPlatformFromMessage(IdMensagem, ed_Num.Text);
  end;

end;

procedure TframeMensagem.btnImagemBotaoClick(Sender: TObject);
{var
  content, options, options_Figurinha, options_Imagem, options_Audio,
    description, buttontext, menu, menu2, menu3 : string;
  LBase64 : TStringList;}
var
  content, options : string;
  LBase64 : TStringList;
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  if Trim(mem_message.Text) = '' then
  begin
    messageDlg('Informe o Nome do Canal para na Caixa da Mensagem para Continuar', mtWarning, [mbOk], 0);
    mem_message.SetFocus;
    Exit;
  end;

  LBase64 := TStringList.Create;
  TRY
    if FileExists('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt') then
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt')
    else
    begin
      {inicio - capturando imagem e convertendo em base 64}
      OpenDialog1.Execute;
      Image1.Picture.LoadFromFile(OpenDialog1.FileName);
      lblCaminhoImagem.Caption := OpenDialog1.FileName;
      LBase64.text  := ImageToBase64( Image1 ) ;
      //LBase64.text := StrExtFile_Base64Type( ExtractFileName(OpenDialog1.FileName) ) + LBase64.text; //add DataURI
      memo1.clear;
      memo1.Text    := LBase64.text ;
      {final - capturando imagem e convertendo em base 64}
    end;

    options := 'description:"Description for that",picture:"' + LBase64.Text + '"';
    //options := 'description:"Description for that"'; //sem imagem

    //Nome do Canal
    content := mem_message.Text;
    frDemo.TWPPConnect1.CreateNewsLetter(content, options);

  finally
    freeAndNil(LBase64);
  end;
(*
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
      if FileExists('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt') then
        LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt')
      else
      begin
        {inicio - capturando imagem e convertendo em base 64}
        OpenDialog1.Execute;
        Image1.Picture.LoadFromFile(OpenDialog1.FileName);
        lblCaminhoImagem.Caption := OpenDialog1.FileName;
        LBase64.text  := ImageToBase64( Image1 ) ;
        LBase64.text := StrExtFile_Base64Type( ExtractFileName(OpenDialog1.FileName) ) + LBase64.text; //add DataURI
        memo1.clear;
        memo1.Text    := LBase64.text ;
        {final - capturando imagem e convertendo em base 64}
      end;

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      options :=
        'createChat: true, ' +
        ///'useTemplateButtons: undefined, ' +
        'useTemplateButtons: true, ' + //Crash iOS True
        //'title: "Novidades",  ' +
        //'footer: "Imagem com Botão",  ' +
        'caption: "My image", ' +
        'type: "image", ' +
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


      frDemo.TWPPConnect1.SendFileMessageEx(ed_num.text, LBase64.Text, options, '123');


    FINALLY
      freeAndNil(LBase64);
    END;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
  *)
end;

procedure TframeMensagem.btnImagemClick(Sender: TObject);
var
  content, options, caption : string;
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
      //LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt');
      if FileExists('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt') then
        LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt')
      else
      begin
        {inicio - capturando imagem e convertendo em base 64}
        OpenDialog1.Execute;
        Image1.Picture.LoadFromFile(OpenDialog1.FileName);
        lblCaminhoImagem.Caption := OpenDialog1.FileName;
        LBase64.text  := ImageToBase64( Image1 ) ;
        LBase64.text := StrExtFile_Base64Type( ExtractFileName(OpenDialog1.FileName) ) + LBase64.text;  //add DataURI
        memo1.clear;
        memo1.Text    := LBase64.text ;
        {final - capturando imagem e convertendo em base 64}
      end;

      content := frDemo.CaractersWeb(mem_message.Text);

      caption := frDemo.CaractersWeb(mem_message.Text);

      options :=
        ' type: "image", ' +
        ' caption: "' + caption + '",  ' +
        ' isViewOnce: false  '; //Temporaria Somente 1 Visualização

      frDemo.TWPPConnect1.SendFileMessageEx(ed_num.text, LBase64.Text, options, '123');

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
      if FileExists('C:\Executaveis\WPPConnectDemo\Base64ImagemPuro.txt') then
      begin
        LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64ImagemPuro.txt');
        memo1.clear;
        memo1.Text := LBase64.text;
      end
      else
      begin
        {inicio - capturando imagem e convertendo em base 64}
        OpenDialog1.Execute;
        Image1.Picture.LoadFromFile(OpenDialog1.FileName);
        lblCaminhoImagem.Caption := OpenDialog1.FileName;
        LBase64.text  := ImageToBase64( Image1 ) ;
        //LBase64.text := StrExtFile_Base64Type( ExtractFileName(OpenDialog1.FileName) ) + LBase64.text;  //add DataURI
        memo1.clear;
        memo1.Text := LBase64.Text ;
        {final - capturando imagem e convertendo em base 64}
      end;
    FINALLY
      options :=
        '"linkPreview": { ' +
        '  "title": "WPPConnect", ' +
        '  "description": "WPPConnect/WA-JS", ' +
        '  "canonicalUrl": "' + edtUrl.text + '",  ' +
        '  "matchedText": "' + edtUrl.text + '",  ' +
        '  "doNotPlayInline": false, ' +
        '  "richPreviewType": 0, ' +
        '  "thumbnail": "' + LBase64.Text {memo1.Text} + '" ' +
        '}';
      freeAndNil(LBase64);
    END;



(*linkPreview?: boolean | {
    canonicalUrl?: string;
    description?: string;
    doNotPlayInline: boolean;
    matchedText?: string;
    richPreviewType?: number;
    thumbnail?: string;
    title?: string;}*)

    //frDemo.TWPPConnect1.sendLinkPreview(ed_num.text, edtUrl.text, options);
    frDemo.TWPPConnect1.SendTextMessageEx(ed_num.text, edtUrl.text, options, '123');

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
      'createChat: true,' +
      'title: "Escolha uma Opção", ' +
      'footer: "Toque no Botão Formas de Pagamentos e Escolha uma Opção", '+
      'buttonText:"Formas de Pagamento",' +
      'description:"Como deseja pagar pelo servico",' +
      'sections:'+
      '[' +
      '{ title: "Na Hora", rows: [{ rowId: "idDinheiro", title: "\💵 Dinheiro", description: "Receber no local." }]},' +
      '{ title: "On-line", rows: [{ rowId: "idFormas", title: "\💱 Pix", description: "Chave: 123456789"},' +
        '{ rowId: "idCartao1", title: "1 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ rowId: "idCartao2", title: "2 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ rowId: "idCartao3", title: "3 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ rowId: "idCartao4", title: "4 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ rowId: "idCartao5", title: "5 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ rowId: "idCartao6", title: "6 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ rowId: "idCartao7", title: "7 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ rowId: "idCartao8", title: "8 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ rowId: "idCartao9", title: "9 Cartao Credito", description: "Pode parcelar em ate 12x" },' +
        '{ rowId: "idCartao10", title: "10 Cartao Credito", description: "Pode parcelar em ate 12x"},' +
        '{ rowId: "idCartao11", title: "11 Cartao Credito", description: "Pode parcelar em ate 12x"},' +
        '{ rowId: "idCartao12", title: "12 Cartao Credito", description: "Pode parcelar em ate 12x"}' +
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



    //frDemo.TWPPConnect1.SendListMessage(ed_num.text, ButtonText, description, menu, '');
    frDemo.TWPPConnect1.SendListMessageEx(ed_num.text, ButtonText, description, menu, '123');

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnLocalizacaoBotaoClick(Sender: TObject);
var
  options : string;
  horarioAgendamento: string;
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

    horarioAgendamento := '';

    //horarioAgendamento :=  IntToStr(DateTimeToUnix( IncDay(now,3), False) * 1000);
    horarioAgendamento :=  IntToStr(DateTimeToUnix( IncMinute(now,3), False) * 1000);

    options :=
      'title:"Reunião Agendada",' +
      //'callType:"voice",'+
      'callType:"video",'+
      'scheduledTimestampMs:' + horarioAgendamento;
      //'scheduledTimestampMs: 1696084222000';

    frDemo.TWPPConnect1.sendScheduledCallMessage(ed_num.text, options);


    (*options :=
      'createChat: true, ' +
      'lat: -22.95201, ' +
      'lng: -43.2102601, ' +
      'name: "Cristo Rendentor", ' +
      'address: "Parque Nacional da Tijuca - Alto da Boa Vista, Rio de Janeiro - RJ", ' +
      'url: "https://santuariocristoredentor.com.br/", ' +
      'useTemplateButtons: undefined, ' +
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
  *)



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
      'createChat: true, ' +
      'lat: -22.95201, ' +
      'lng: -43.2102601, ' +
      'name: "Cristo Rendentor", ' +
      'createChat: true, ' +
      'title: "Cristo Rendentor",  ' +
      'footer: "Pacote de Viagem",  ' +
      'address: "Parque Nacional da Tijuca - Alto da Boa Vista, Rio de Janeiro - RJ"';

    //frDemo.TWPPConnect1.SendLocationMessage(ed_num.text, options, '');
    //Marcelo 17/09/2022
    frDemo.TWPPConnect1.SendLocationMessageEx(ed_num.text, options, '123');

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnDeletarOldChatClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  frDemo.TWPPConnect1.DeletarOldChats('2'); //Exemplo Apagando os 2 Últimos Chats mais antigos da sua lista de conversa

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
      //frDemo.TWPPConnect1.SendTextMessage(ed_num.text, content, option);
      frDemo.TWPPConnect1.SendTextMessageEx(ed_num.text, content, option, '123');
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

procedure TframeMensagem.btnStatusImagemClick(Sender: TObject);
var
  options, content : string;
  LBase64 : TStringList;
begin
  try
    if not frDemo.TWPPConnect1.Auth then
       Exit;

    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt');
      options := '';

      {content := mem_message.Text;
      if Trim(content) = '' then
        content := 'TESTE STATUS';
      options := 'backgroundColor: "#0275d8", font: 0'; }

      //options := 'backgroundColor: "#0275d8", font: 2';
      //https://wppconnect-team.github.io/wa-js/interfaces/status.TextStatusOptions.html

      frDemo.TWPPConnect1.sendImageStatus(LBase64.Text, options);

    finally
      freeAndNil(LBase64);
    end;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnStatusTextoClick(Sender: TObject);
var
  options, content : string;
begin
  try
    if not frDemo.TWPPConnect1.Auth then
       Exit;

    content := mem_message.Text;
    if Trim(content) = '' then
      content := 'TESTE STATUS';
    options := 'backgroundColor: "#0275d8", font: 0';
    //options := 'backgroundColor: "#0275d8", font: 2';
    //https://wppconnect-team.github.io/wa-js/interfaces/status.TextStatusOptions.html

    frDemo.TWPPConnect1.sendTextStatus(content, options);

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
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
      if FileExists('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt') then
        LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\Base64Imagem.txt')
      else
      begin
        {inicio - capturando imagem e convertendo em base 64}
        OpenDialog1.Execute;
        Image1.Picture.LoadFromFile(OpenDialog1.FileName);
        lblCaminhoImagem.Caption := OpenDialog1.FileName;
        LBase64.text  := ImageToBase64( Image1 ) ;
        LBase64.text := StrExtFile_Base64Type( ExtractFileName(OpenDialog1.FileName) ) + LBase64.text; //add DataURI
        memo1.clear;
        memo1.Text    := LBase64.text ;
        {final - capturando imagem e convertendo em base 64}
      end;

      content := mem_message.Text;

      options_Audio :=
        'type: "audio", ' +
        'isPtt: true'; // false for common audio

      options :=
        'createChat: true, ' +
        'useTemplateButtons: undefined, ' +
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
      //frDemo.TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options_Figurinha, '');
      frDemo.TWPPConnect1.SendFileMessageEx(ed_num.text, LBase64.Text, options_Figurinha, '123');
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

    options := 'createChat: true';

    //Opicional Não Utilizar para primeira mensagem, somente para contatos que já houve alguma interação
    frDemo.TWPPConnect1.setKeepAlive('true'); //Marca como Online
    frDemo.TWPPConnect1.markIsComposing(ed_num.Text, '5000'); //Digitando 5 Segundos
    //Sleep(5000);

    frDemo.TWPPConnect1.SendTextMessageEx(ed_num.Text, mem_message.Text, options, '123');
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnValidarListarNumerosClick(Sender: TObject);
var
OpenFileTXT : TOpenDialog;
memocontact : Tmemo;
memoCoctacValid : tmemo;
a : integer;
begin
  OpenFileTXT := TOpenDialog.Create(self);
  memocontact := TMemo.Create(self);
  memocontact.parent := self;
  memocontact.Visible := false;

  memoCoctacValid := TMemo.Create(self);
  memoCoctacValid.parent := self;
  memoCoctacValid.Visible := false;
  memoCoctacValid.Lines.Add('NUMEROS VALIDOS');

  try
    OpenFileTXT.Filter := '*.txt|*.txt'; {carregando numero de um arquivo txt}
    if OpenFileTXT.Execute then
    begin
      memocontact.Clear;
      memocontact.Lines.LoadFromFile(OpenFileTXT.FileName) ;
    end;

    {validando listagem do memo}
    frDemo.r_CheckNumber  := true; {ativando rotina by list}
    for a := 0 to pred(memocontact.Lines.Count)do
    begin
     repeat
       if frDemo.v_ValidNumberSleep = false then {validando modo espera}
       begin
         frDemo.v_ValidNumberSleep  := true;
         frDemo.TWPPConnect1.CheckNumberExists( memocontact.Lines[a] );
         SleepNoFreeze(1500);
       end;
     until (frDemo.v_Checado = true);
     frDemo.v_ValidNumberSleep  := false;  {saindo do modo espera}
     if frDemo.v_ValidNumber then {testando resultado}
     memoCoctacValid.Lines.Add( memocontact.Lines[a]);
    end;

  finally
   memoCoctacValid.Lines.SaveToFile('C:\Executaveis\WPPConnectDemo\temp\wpp4delphi_numberchecklist_'+FormatDateTime('ddmmyyyy hhnnss', now) +'.txt');
   OpenFileTXT.Free;
   memocontact.free;
   memoCoctacValid.free;
  end;
end;

procedure TframeMensagem.btnVerificarNumeroClick(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  if Trim(ed_num.Text) = '' then
  begin
    messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
    ed_num.SetFocus;
    Exit;
  end;

  //frDemo.TWPPConnect1.NewCheckIsValidNumber('5517981388414@c.us');
  //frDemo.TWPPConnect1.NewCheckIsValidNumber(ed_num.Text);
  //Marcelo 18/07/2022
  frDemo.TWPPConnect1.CheckNumberExists(ed_num.Text);

end;

procedure TframeMensagem.btnInstantVideoClick(Sender: TObject);
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
      //LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\base64Videos2.txt');

      if FileExists('C:\Executaveis\WPPConnectDemo\base64Videos2.txt') then
        LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\base64Videos2.txt')
      else
      begin
        {inicio - capturando arquivo mp3 e convertendo em base 64}
        OpenDialog1.Execute;
        lblCaminhoImagem.Caption := OpenDialog1.FileName;
        LBase64.text  := FileToBase64( OpenDialog1.FileName, 'video' ) ;  //FileToBase64
        LBase64.text := StrExtFile_Base64Type( ExtractFileName(OpenDialog1.FileName) ) + LBase64.text; //add DataURI
        memo1.clear;
        memo1.Text    := LBase64.text ;
        {final - capturando arquivo mp3 e convertendo em base 64}
      end;

      content := mem_message.Text;

      options :=
        'createChat: true, ' +
        'type: "ptv", ' +
        'isPtv: true';

      frDemo.TWPPConnect1.SendFileMessageEx(ed_num.text, LBase64.Text, options, '123');


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

    try
      //LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\base64Videos2.txt');

      if FileExists('C:\Executaveis\WPPConnectDemo\base64Videos2.txt') then
        LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\base64Videos2.txt')
      else
      begin
        {inicio - capturando arquivo mp3 e convertendo em base 64}
        OpenDialog1.Execute;
        lblCaminhoImagem.Caption := OpenDialog1.FileName;
        LBase64.text  := FileToBase64( OpenDialog1.FileName, 'video' ) ;  //FileToBase64
        LBase64.text := StrExtFile_Base64Type( ExtractFileName(OpenDialog1.FileName) ) + LBase64.text; //add DataURI
        memo1.clear;
        memo1.Text    := LBase64.text ;
        {final - capturando arquivo mp3 e convertendo em base 64}
      end;

      content := mem_message.Text;

      options := 'createChat: true, type: "video", caption: "My Video"  ';

      //VIDEO
      //frDemo.TWPPConnect1.SendFileMessage(ed_num.text, LBase64.Text, options, '');
      frDemo.TWPPConnect1.SendFileMessageEx(ed_num.text, LBase64.Text, options, '123');

    finally
      freeAndNil(LBase64);
    end;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnVideoStatusClick(Sender: TObject);
var
  options, content : string;
  LBase64 : TStringList;
begin
  try
    if not frDemo.TWPPConnect1.Auth then
       Exit;

    LBase64 := TStringList.Create;
    TRY
      LBase64.LoadFromFile('C:\Executaveis\WPPConnectDemo\base64Videos2.txt');
      options := '';

      {content := mem_message.Text;
      if Trim(content) = '' then
        content := 'TESTE STATUS';
      options := 'backgroundColor: "#0275d8", font: 0'; }

      //options := 'backgroundColor: "#0275d8", font: 2';
      //https://wppconnect-team.github.io/wa-js/interfaces/status.TextStatusOptions.html

      frDemo.TWPPConnect1.sendImageStatus(LBase64.Text, options);

    finally
      freeAndNil(LBase64);
    end;
  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.Button1Click(Sender: TObject);
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  if Trim(ed_num.Text) = '' then
  begin
    messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
    ed_num.SetFocus;
    Exit;
  end;

  frDemo.TWPPConnect1.setKeepAlive('true'); //Marca como Online
  frDemo.TWPPConnect1.markIsComposing(ed_num.Text, '5000'); //Digitando 5 Segundos

  frDemo.TWPPConnect1.getLastSeen(ed_num.Text);
end;

procedure TframeMensagem.Button2Click(Sender: TObject);
var
  IdMensagem : string;
begin

  try
    if not frDemo.TWPPConnect1.Auth then
      Exit;

    if Trim(ed_num.Text) = '' then
    begin
      MessageDlg('Informe o Celular para Continuar', mtWarning, [mbOK],0);
      ed_num.SetFocus;
      Exit;
    end;


    if InputQuery('Informe a ID da Mensagem.', 'Unique ID: ', IdMensagem) then
    begin

      frDemo.TWPPConnect1.deleteMessageById(ed_num.Text, IdMensagem);
    end;


  finally
  end;

end;

procedure TframeMensagem.Button3Click(Sender: TObject);
var
  IdMensagem : string;
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  if InputQuery('Informe a ID da Mensagem.', 'Unique ID: ', IdMensagem) then
  begin

    frDemo.TWPPConnect1.getMessageACK(IdMensagem);
  end;

end;

procedure TframeMensagem.Button4Click(Sender: TObject);
var
  IdMensagem : string;
begin
  if not frDemo.TWPPConnect1.Auth then
    Exit;

  if InputQuery('Informe a ID da Mensagem.', 'Unique ID: ', IdMensagem) then
  begin
    //Marcelo 19/03/2023
    frDemo.TWPPConnect1.markPlayed(IdMensagem);
  end;

end;

procedure TframeMensagem.btnLigarClick(Sender: TObject);
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

    options := '';
    //options := 'isVideo: true'; //Chamada de Video

    //frDemo.TWPPConnect1.sendLinkPreview(ed_num.text, edtUrl.text, options);
    frDemo.TWPPConnect1.SendCall(ed_num.text, options);

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnEncerrarChamadaClick(Sender: TObject);
begin
  try
    {if Trim(ed_num.Text) = '' then
    begin
      messageDlg('Informe o Celular para Continuar', mtWarning, [mbOk], 0);
      ed_num.SetFocus;
      Exit;
    end;}

    if not frDemo.TWPPConnect1.Auth then
      Exit;

    //frDemo.TWPPConnect1.EndCall(ed_num.text);
    frDemo.TWPPConnect1.EndCallALL;

  finally
    ed_num.SelectAll;
    ed_num.SetFocus;
  end;
end;

procedure TframeMensagem.btnArquivoClick(Sender: TObject);
var
  caption, Extensao : string;
  caminhoArquivo : string;
  isFigurinha : Boolean;
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

    caption := frDemo.CaractersWeb(mem_message.Text);

    caminhoArquivo := '';

    OpenDialog1.Execute();

    if FileExists(OpenDialog1.FileName) then
      caminhoArquivo := OpenDialog1.FileName
    else
      Exit;

    Extensao  := LowerCase(Copy(ExtractFileExt(caminhoArquivo),2,5));

    if Extensao = 'webp' then
      isFigurinha := True else
      isFigurinha := False;

    //Arquivo Selecionado da Pasta
    frDemo.TWPPConnect1.SendFileMessageEx(ed_num.text, caminhoArquivo, '123', caption, isFigurinha);


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
  //frDemo.TWPPConnect1.getAllContacts;
  frDemo.TWPPConnect1.getMyContacts;
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
  if pos('@lid', listaContatos.Items[listaContatos.Selected.Index].SubItems[1]) > 0 then
  begin
    ed_num.text := frDemo.SomenteNumero(copy(listaContatos.Items[listaContatos.Selected.Index].SubItems[1],
      pos('-', listaContatos.Items[listaContatos.Selected.Index].SubItems[1]) + 1, length(listaContatos.Items[listaContatos.Selected.Index].SubItems[1])));
    ed_num.Text := Copy(ed_num.Text, 1, length(ed_num.Text)-1);
    ed_num.Text :=  ed_num.Text + '@c.us'
  end
  else
    ed_num.text := copy(listaContatos.Items[listaContatos.Selected.Index].SubItems[1], 0,
      pos('@', listaContatos.Items[listaContatos.Selected.Index].SubItems[1])) + 'c.us';
end;

{$REGION 'CONVERSAO BASE64'}
function TframeMensagem.DecodeString(const Input: string): string;
var
  InStr, OutStr: TStringStream;
begin
  InStr := TStringStream.Create(Input);
  try
    OutStr := TStringStream.Create('', TEncoding.UTF8);
    try
      DecodeStream(InStr, OutStr);
      Result := OutStr.DataString;
    finally
      OutStr.Free;
    end;
  finally
    InStr.Free;
  end;
end;

function TframeMensagem.EncodeString(const Input: string): string;
var
  InStr, OutStr: TStringStream;
begin
  InStr := TStringStream.Create(Input, TEncoding.UTF8);
  try
    OutStr := TStringStream.Create('');
    try
      EncodeStream(InStr, OutStr);
      Result := OutStr.DataString;
    finally
      OutStr.Free;
    end;
  finally
    InStr.Free;
  end;
end;

function TframeMensagem.FileToBase64(const AInFileName, AOutFileName: string): string;
var
  inStream: TStream;
  outStream: TStream;
begin
  inStream := TFileStream.Create(AInFileName, fmOpenRead);
  try
    outStream := TFileStream.Create(AOutFileName, fmCreate);
    try
      inStream.Position := 0;
      TNetEncoding.Base64.Encode(inStream, outStream);
      outStream.Position := 0;
      Memo1.Lines.LoadFromStream(outStream)  ;
      result := Memo1.text;
    finally
      outStream.Free;
      DeleteFile(ExtractFilePath(Application.ExeName) + AOutFileName );
    end;
  finally
    inStream.Free;
  end;
end;

function TframeMensagem.ImageToBase64(ImageExibicao: TImage): String;
var
  LInput : TMemoryStream;
  LOutput: TMemoryStream;
  Imagetxt : TStringList;
begin
  try
    LInput := TMemoryStream.Create;
    LOutput := TMemoryStream.Create;
    Imagetxt := TStringList.Create;

    ImageExibicao.Picture.SaveToStream(LInput);
    LInput.Position := 0;
    TNetEncoding.Base64.Encode( LInput, LOutput );
    LOutput.Position := 0;
    Memo1.Lines.LoadFromStream(LOutput)  ;
    result := Memo1.text;
  finally
    LInput.Free;
    LOutput.Free;
    Imagetxt.Free;
  end;
end;

function TframeMensagem.StrExtFile_Base64Type(PFileName: String): String;
var
  I: Integer;
  LExt: String;
  Ltmp: String;
begin
  LExt   := LowerCase(Copy(ExtractFileExt(PFileName),2,50));

  //Marcelo 31/05/2022
  if (LExt = 'mp3') then
    begin
      result := 'data:audio/mpeg;base64,';
      exit;
    end;

  //Marcelo 08/06/2022
  if (LExt = 'ogg') then
    begin
      result := 'data:audio/ogg;base64,';
      exit;
    end;

  //Marcelo 08/06/2022
  if (LExt = 'mp4') then
    begin
      result := 'data:video/mp4;base64,';
      exit;
    end;

  //Marcelo 08/06/2022
  if (LExt = 'avi') then
    begin
      result := 'data:video/avi;base64,';
      exit;
    end;

  //Marcelo 08/06/2022
  if (LExt = 'mpeg') then
    begin
      result := 'data:video/mpeg;base64,';
      exit;
    end;


  Result := 'data:application/';
  try
    for I := 0 to 10 do
    begin
      Ltmp := LowerCase(Copy(GetEnumName(TypeInfo(TExt_Image), ord(TExt_Image(i))), 3, 50));
      if pos(LExt, Ltmp) > 0 Then
      Begin
        Result := 'data:image/';
        Exit;
      end
    end;
  finally
     Result := Result + LExt + ';base64,' ;
  end;
end;

{$ENDREGION}

end.
