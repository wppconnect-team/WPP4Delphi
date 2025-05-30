﻿{####################################################################################################################
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
unit uTWPPConnect.languages;

interface

uses uTWPPConnect.Constant, Winapi.Windows, System.Classes;

Type

  TTranslatorInject = Class(TPersistent)
  Private
    Procedure LanguageDefault;
    procedure LanguageEnglish;

    class procedure SetResourceString(xOldResourceString: PResStringRec; xValueChanged: PChar);

    procedure LanguageEspanol;
    procedure LanguageItalian; //Suggestion --> enricogaggero 14/09/2024

    //Gerado por IA, necessário revisão
    //AI generated, review required
    procedure LanguageFarsi;
    procedure LanguageGerman;
    procedure LanguageFrench;
    procedure LanguageRussian;
    procedure LanguageAfrikaans;
    procedure LanguageHindi; //India
    procedure LanguageIndonesian;
    procedure LanguageTurkish;
    procedure LanguageUrdu; //Paquistão - Pakistan
    procedure LanguageBengali; //Bangladesh – Bengali
  Public
    Procedure SetTranslator(Const PLanguage: TLanguageInject);
  End;


implementation
{ LTranslatorInject }


class procedure TTranslatorInject.SetResourceString(
  xOldResourceString: PResStringRec; xValueChanged: PChar);
var
  POldProtect: DWORD;
begin
  VirtualProtect(xOldResourceString, SizeOf(xOldResourceString^), PAGE_EXECUTE_READWRITE, @POldProtect);
  xOldResourceString^.Identifier := Integer(xValueChanged);
  VirtualProtect(xOldResourceString,SizeOf(xOldResourceString^),POldProtect, @POldProtect);
end;

procedure TTranslatorInject.LanguageDefault;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'Não é possível realizar essa operação após a inicialização do componente');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'Erro ao conectar com componente');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'Erro ao criar browser no CEF');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'Você não está conectado ao Servidor de serviço');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'Console ainda não obteve os comandos de INJECT JS');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'Sua versão do CEF4 não é compatível, por favor, atualize suas biblioteca em https://github.com/salvadordf/CEF4Delphi' + slinebreak + 'Versão requerida: %s' + slinebreak + 'Versão identificada: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'O valor deve estar entre 5 e 90');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'Não é possível realizar essa operação após a inicialização do componente');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'Sua versão do componente TWPPConnect não é compatível com o novo JavaScript, por favor, atualize suas biblioteca em http://www.TWPPConnect.com.br/');
  SetResourceString(@MSG_ExceptUpdate                     , 'Erro de servidor WEB. Não foi possível receber a atualização do JS.ABR');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'Enviando o mesmo comando em um intervalo pequeno');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'Retorno JS.ABR não conhecido');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode não foi definido');
  SetResourceString(@Text_FrmClose_Caption                , 'Aguarde.. Finalizando o serviço..');
  SetResourceString(@Text_FrmClose_Label                  , 'Finalizando todas as threads com segurança');
  SetResourceString(@Text_FrmClose_WarningClose           , 'Deseja Finalizar a aplicação?');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'Carregando QR Code...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'Aponte seu celular agora!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'Cancelar entrada ao Servidor de serviço?');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'Número inválido');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'Não é possível modificar em Modo Designer');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'Método não pode ser modificado após TWPPConnect Inicializado');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'Não existem contatos a serem exportados');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'Não foi possivel salvar os contatos em %s');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'Erro ao localizar FORM');
  SetResourceString(@MSG_ExceptPath                       , 'O caminho %s é inválido');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'Classe GLOBALCEF não definida no DPR');
  SetResourceString(@MSG_WarningClosing                   , 'Aguarde... Finalizando aplicação');
  SetResourceString(@MSG_WarningErrorFile                 , 'Erro no arquivo repassado (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'Erro Desconhecido');
  SetResourceString(@Text_FrmConsole_Caption              , 'Componente TWPPConnect Brasil');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'Aguarde.. Inicializando comunicação');
  SetResourceString(@MSG_WarningClassUnknown              , 'Classe Desconhecida');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'Seu computador não possui as DLLs "libeay32.dll" e "ssleay32.dll". Para continuar coloque as DLL na pasta system ou dentro do diretório da aplicação.');
  SetResourceString(@Text_Vcard_Comments1                 , 'Exportado do Componente TWPPConnect em' );
  SetResourceString(@Text_Vcard_Comments2                 , 'Contato Silenciado');
  SetResourceString(@Text_Vcard_Comments3                 , 'Capturado em:');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'A sessão anterior ainda está sendo finalizada, tente novamente mais tarde');
  SetResourceString(@Text_Status_Serv_Initialized         , 'Conectado com sucesso ao Servidor de serviço');
  SetResourceString(@Text_Status_Serv_Initializing        , 'Inicializando Servidor de serviço');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'Não Conectado ao Servidor de serviço e TWPPConnect');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'Desconectado do Servidor de serviço e TWPPConnect ');
  SetResourceString(@Text_Status_Serv_Connected           , 'Servidor de serviço Conectado');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'Sessão finalizada via Celular');
  SetResourceString(@Text_Status_Serv_Connecting          , 'Aguarde, Conectando ao Servidor de serviço');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'Erro ao conectar, Telefone desligado');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'Aguardando leitura QR Code');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'Erro ao conectar (TimeOut)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'Destruindo e fechando TWPPConnect');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect finalizado');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Reiniciando Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Carregado');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Online Pronto');

  SetResourceString(@MSG_WarningNothingtoSend             , 'Não existe nenhum conteúdo a ser enviado na mensagem');

  SetResourceString(@MSG_Except_Data_TypeObj              , 'Tipo de objeto não é compatível');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'Tipo de DataSet não possui Conexão com Banco de dados');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'Conexão Nao vinculada');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'Atribuição Inválida(já esta em uso por outro objeto)');
  SetResourceString(@MSG_WarningDeveloper                 , 'Aviso ao Desenvolvedor VIA IDE');
  SetResourceString(@Text_DefaultPathDown                 , 'TWPPConnectAnexos');
  SetResourceString(@Text_DefaultError                    , 'Erro ao criar diretório em ');
  SetResourceString(@MSG_Except_SaveAttached              , 'Erro ao salvar arquivo em anexo à mensagem');
  SetResourceString(@MSG_Except_CefNull                   , 'Componente GlobalCEFApp não foi inicializado em seu .DPR (Verifique o .DPR da aplicação DEMO para melhor entendimento)');
  SetResourceString(@Text_System_memUse                   , 'Memória usada pela Aplicação: ');
  SetResourceString(@Text_System_memTot                   , 'Memória total: ');
  SetResourceString(@Text_System_memFree                  , 'Memória física disponível: ');
  SetResourceString(@Text_System_memLoad                  , 'Mémoria Carregada: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'Configuração de LAN');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'Tipo:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'Protocolo:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'Servidor:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'Porta:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'Usuário:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'Senha:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'Script de Configuração Automática:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'Não usar proxy nos endereços: (use ponto-e-vírgula para separar entradas)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'Número máximo de conexões por proxy:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , 'Personalização de Cabeçalhos:');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'Nome "Variável":');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'Valor "Variável":');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'Salvar');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'Cancelar');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'Deseja realmente aplicar essas configurações?');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
//  SetResourceString(@Text_FrmClose_WarningClose           , '');
end;



procedure TTranslatorInject.LanguageEnglish;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'It is not possible to perform this operation after the component has been initialized');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'Error connecting with component');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'Error creating browser in CEF');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'You are not connected to the service server');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'Console has not yet obtained the commands for INJECT JS');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'Your CEF4 version is not compatible, please update your library at https://github.com/salvadordf/CEF4Delphi' + slinebreak + 'Required version: %s' + slinebreak + 'Identified version: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'Value must be between 5 and 90');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'It is not possible to perform this operation after the component has been initialized');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'Your version of TWPPConnect component is not compatible with the latest JavaScript version, please update your library at http://www.TWPPConnect.com.br/');
  SetResourceString(@MSG_ExceptUpdate                     , 'WEB server error. Unable to receive JS.ABR update');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'Sending the same command within a short interval');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'Unknown JS.ABR return');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode has not been defined');
  SetResourceString(@Text_FrmClose_Caption                , 'Wait.. TWPPConnect is Terminating..');
  SetResourceString(@Text_FrmClose_Label                  , 'Terminating all threads safely');
  SetResourceString(@Text_FrmClose_WarningClose           , 'Do you want to close the application?');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'Loading QRCode...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'Point your phone now!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'Cancel service server? connection');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'Invalid Number');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'It is not possible to modify in Designer Mode');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'Method Cannot Be Modified After TWPPConnect has been Initialized');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'There are no contacts to export');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'Unable to save contacts to %s');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'Error locating FORM');
  SetResourceString(@MSG_ExceptPath                       , 'The path %s is invalid');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'GLOBALCEF class has not been defined in DPR');
  SetResourceString(@MSG_WarningClosing                   , 'Wait... closing application');
  SetResourceString(@MSG_WarningErrorFile                 , 'Error on selected file (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'Unknown error');
  SetResourceString(@Text_FrmConsole_Caption              , 'Brazil TWPPConnect Component');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'Wait .. Initializing TWPPConnect');
  SetResourceString(@MSG_WarningClassUnknown              , 'Unknown class');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'Your computer does not have the "libeay32.dll" and "ssleay32.dll" DLLs. To continue place the DLLs in the system folder or in the application directory.');
  SetResourceString(@Text_Vcard_Comments1                 , 'Exported from TWPPConnect Component in: ' );
  SetResourceString(@Text_Vcard_Comments2                 , 'Contact has been silenced');
  SetResourceString(@Text_Vcard_Comments3                 , 'Captured in: ');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'A previous session is still running, please try again later');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect connected successfully to the service server');
  SetResourceString(@Text_Status_Serv_Initializing        , 'Initializing TWPPConnect to service server');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'Not connected to service server and TWPPConnect');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'Disconnected from service server and TWPPConnect ');
  SetResourceString(@Text_Status_Serv_Connected           , 'Connected to service server');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'Session terminated via Mobile');
  SetResourceString(@Text_Status_Serv_Connecting          , 'Wait, connecting to service server');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'Error connecting, phone is turned off');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'Waiting QR code scan');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'Unabke to connect (TimeOut)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'Destroying and closing the TWPPConnect');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect has been terminated');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'There is no content to send in this message');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'Object type is not compatible');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'DataSet Type Does Not Have Database Connection');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'Unlinked connection');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'Invalid attribution (already in use by another object)');

  SetResourceString(@MSG_WarningDeveloper                 , 'Developer notice (IDE)');
  SetResourceString(@Text_DefaultPathDown                 , 'TWPPConnectAttachment');
  SetResourceString(@Text_DefaultError                    , 'Error creating directory in ');
  SetResourceString(@MSG_Except_SaveAttached              , 'Error saving file attached to message');
  SetResourceString(@MSG_Except_CefNull                   , 'Component GlobalCEFApp has not been initialized in your application (Check DPR of DEMO app)');
  SetResourceString(@Text_System_memUse                   , 'Total memory used by this application: ');
  SetResourceString(@Text_System_memTot                   , 'Total system memory: ');
  SetResourceString(@Text_System_memFree                  , 'Available physical memory: ');
  SetResourceString(@Text_System_memLoad                  , 'Memory load: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'LAN configuration');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'Type:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'Server:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'Protocol:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'Port:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'Username:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'Password:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'Automatic Configuration Script:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'Do not proxy addresses: (use semicolons to separate entries)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'Maximum connections per proxy:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' Custom header: ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'Name "Variable":');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'Value "Variable":');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'Save');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'Cancel');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'Do you really want to apply these settings?');
end;


procedure TTranslatorInject.LanguageEspanol;
begin
  //Revisado por:
  // Daniel Serrano  - darnaldo2005@gmail.com - Quito / Ecuador - 03/01/2020
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'No se puede realizar esta operación después de la inicialización del componente');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'Error al conectar con el componente');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'Error al crear el navegador en CEF');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'No estás conectado al servidor de servicio');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'La consola aún no ha obtenido los comandos para INJECT JS');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'Su versión de CEF4 no es compatible, actualice su biblioteca en https://github.com/salvadordf/CEF4Delphi' + slinebreak + 'Versión requerida: %s' + slinebreak + 'Versión  identificada: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'El valor debe estar entre 5 y 90');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'No se puede realizar esta operación después de la inicialización del componente');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'Su versión del componente TWPPConnect no es compatible con el nuevo JavaScript, actualice sus bibliotecas en http://www.TWPPConnect.com.br/');
  SetResourceString(@MSG_ExceptUpdate                     , 'Error del servidor web. No se puede recibir la actualización JS.ABR');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'Enviar el mismo comando en un intervalo pequeño');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'Devuelve JS.ABR desconocido');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode no se ha establecido');
  SetResourceString(@Text_FrmClose_Caption                , 'Espere... Terminando TWPPConnect..');
  SetResourceString(@Text_FrmClose_Label                  , 'Terminar todos los threads de forma segura');
  SetResourceString(@Text_FrmClose_WarningClose           , '¿Quieres terminar la aplicación?');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'Capturando QRCode...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , '¡Apunte su teléfono ahora!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , '¿Darse de baja del servidor de servicio?');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'Número inválido');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'No se puede modificar en modo de desarrollo');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'El método no se puede modificar después de que TWPPConnect se haya inicializado');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'No se pueden guardar contactos en %s');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'No hay contactos para exportar');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'Error al localizar FORM');
  SetResourceString(@MSG_ExceptPath                       , 'La ruta %s no es válida');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'Clase GLOBALCEF no definida en .DPR');
  SetResourceString(@MSG_WarningClosing                   , 'Por favor espere... Finalizando la aplicación');
  SetResourceString(@MSG_WarningErrorFile                 , 'Error de archivo aprobado (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'Error desconocido');
  SetResourceString(@Text_FrmConsole_Caption              , 'Componente TWPPConnect Brasil');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'Espera ... Inicializando TWPPConnect');
  SetResourceString(@MSG_WarningClassUnknown              , 'Clase desconocida');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'Su computadora no tiene los archivos DLL "libeay32.dll" y "ssleay32.dll". Para continuar, coloque las DLL en la carpeta del sistema o dentro del directorio de la aplicación.');
  SetResourceString(@Text_Vcard_Comments1                 , 'Exportado desde TWPPConnect Component en' );
  SetResourceString(@Text_Vcard_Comments2                 , 'Contacto silenciado');
  SetResourceString(@Text_Vcard_Comments3                 , 'Capturado en:');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'La sesión anterior aún está terminando, intente nuevamente más tarde.');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect se conectó correctamente al servidor de servicio');
  SetResourceString(@Text_Status_Serv_Initializing        , 'Inicializando TWPPConnect al servidor de servicio');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'No conectado al servicio y al servidor TWPPConnect');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'Desconectado del servidor de servicio y TWPPConnect ');
  SetResourceString(@Text_Status_Serv_Connected           , 'Servidor de servicio conectado');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'Sesión finalizada a través del teléfono');
  SetResourceString(@Text_Status_Serv_Connecting          , 'Espera, conectando al servidor de servicio');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'Error al conectar, teléfono apagado');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'En espera a leer el código QR');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'Error al conectar (TimeOut)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'Destruyendo y cerrando la aplicación');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect terminado');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'No hay contenido para enviar en el mensaje');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'El tipo de objeto no es compatible');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'El tipo de conjunto de datos no tiene conexión de base de datos');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'Conexión no transmitida');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'Atribución inválida (ya está en uso por otro objeto)');
  SetResourceString(@MSG_WarningDeveloper                 , 'Aviso del desarrollador através de IDE');
  SetResourceString(@Text_System_memUse                   , 'Memoria total utilizada por esta aplicación: ');
  SetResourceString(@Text_System_memTot                   , 'Memoria total del sistema: ');
  SetResourceString(@Text_System_memFree                  , 'Memoria física disponible: ');
  SetResourceString(@Text_System_memLoad                  , 'Carga de memoria: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'Configuración LAN');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'Tipo:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'Servidor:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'Protocolo:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'Port:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'Nombre usuario:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'Contraseña:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'Script de configuración automática:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'No proxy direcciones: (use punto y coma para separar las entradas)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'Conexiones máximas por proxy:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' Cabeceras personalizadas: ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'Nombre "variable":');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'Valor "Variable":');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'Guardar');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'Cancelar');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , '¿Realmente quieres aplicar esta configuración?');
end;

procedure TTranslatorInject.LanguageFarsi;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'انجام این عملیات پس از مقداردهی اولیه کامپوننت امکان‌پذیر نیست');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'خطا در اتصال به کامپوننت');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'خطا در ایجاد مرورگر در CEF');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'شما به سرور خدمات متصل نیستید');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'کنسول هنوز دستورات برای INJECT JS را دریافت نکرده است');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'نسخه CEF4 شما سازگار نیست، لطفاً کتابخانه خود را در https://github.com/salvadordf/CEF4Delphi به‌روز کنید' + slinebreak + 'نسخه مورد نیاز: %s' + slinebreak + 'نسخه شناسایی شده: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'مقدار باید بین 5 تا 90 باشد');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'انجام این عملیات پس از مقداردهی اولیه کامپوننت امکان‌پذیر نیست');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'نسخه کامپوننت TWPPConnect شما با آخرین نسخه جاوا اسکریپت سازگار نیست، لطفاً کتابخانه خود را در http://www.TWPPConnect.com.br/ به‌روز کنید');
  SetResourceString(@MSG_ExceptUpdate                     , 'خطای سرور وب. به‌روزرسانی JS.ABR قابل دریافت نیست');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'ارسال دستور مشابه در یک بازه زمانی کوتاه');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'پاسخ ناشناخته از JS.ABR');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode تعریف نشده است');
  SetResourceString(@Text_FrmClose_Caption                , 'صبر کنید... TWPPConnect در حال بسته شدن است...');
  SetResourceString(@Text_FrmClose_Label                  , 'بستن امن تمامی نخ‌ها');
  SetResourceString(@Text_FrmClose_WarningClose           , 'آیا می‌خواهید برنامه را ببندید؟');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'در حال بارگذاری QRCode...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'اکنون گوشی خود را نشان دهید!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'قطع اتصال به سرور خدمات؟');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'شماره نامعتبر است');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'امکان تغییر در حالت Designer وجود ندارد');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'روش پس از مقداردهی اولیه TWPPConnect قابل تغییر نیست');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'هیچ تماسی برای صادر کردن وجود ندارد');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'ذخیره تماس‌ها در %s امکان‌پذیر نیست');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'خطا در پیدا کردن فرم');
  SetResourceString(@MSG_ExceptPath                       , 'مسیر %s نامعتبر است');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'کلاس GLOBALCEF در DPR تعریف نشده است');
  SetResourceString(@MSG_WarningClosing                   , 'صبر کنید... برنامه در حال بسته شدن است');
  SetResourceString(@MSG_WarningErrorFile                 , 'خطا در فایل انتخاب شده (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'خطای ناشناخته');
  SetResourceString(@Text_FrmConsole_Caption              , 'کامپوننت TWPPConnect برزیل');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'صبر کنید... در حال مقداردهی اولیه TWPPConnect');
  SetResourceString(@MSG_WarningClassUnknown              , 'کلاس ناشناخته');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'رایانه شما فایل‌های DLL "libeay32.dll" و "ssleay32.dll" را ندارد. برای ادامه، این فایل‌ها را در پوشه سیستم یا دایرکتوری برنامه کپی کنید.');
  SetResourceString(@Text_Vcard_Comments1                 , 'صادر شده از کامپوننت TWPPConnect در: ' );
  SetResourceString(@Text_Vcard_Comments2                 , 'تماس به حالت سکوت درآمده است');
  SetResourceString(@Text_Vcard_Comments3                 , 'گرفته شده در: ');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'یک جلسه قبلی همچنان در حال اجرا است، لطفاً بعداً دوباره تلاش کنید');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect با موفقیت به سرور خدمات متصل شد');
  SetResourceString(@Text_Status_Serv_Initializing        , 'TWPPConnect در حال اتصال به سرور خدمات است');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'به سرور خدمات و TWPPConnect متصل نیست');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'از سرور خدمات و TWPPConnect قطع شد');
  SetResourceString(@Text_Status_Serv_Connected           , 'به سرور خدمات متصل شد');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'جلسه از طریق موبایل خاتمه یافت');
  SetResourceString(@Text_Status_Serv_Connecting          , 'صبر کنید، در حال اتصال به سرور خدمات');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'خطا در اتصال، گوشی خاموش است');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'در انتظار اسکن کد QR');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'امکان اتصال وجود ندارد (Timeout)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'در حال از بین بردن و بستن TWPPConnect');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect خاتمه یافته است');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'هیچ محتوایی برای ارسال در این پیام وجود ندارد');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'نوع شیء سازگار نیست');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'نوع DataSet اتصال به پایگاه داده ندارد');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'اتصال برقرار نشده است');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'اختصاص نامعتبر (در حال حاضر توسط یک شیء دیگر استفاده می‌شود)');

  SetResourceString(@MSG_WarningDeveloper                 , 'اعلان برای توسعه‌دهنده (IDE)');
  SetResourceString(@Text_DefaultPathDown                 , 'TWPPConnectAttachment');
  SetResourceString(@Text_DefaultError                    , 'خطا در ایجاد دایرکتوری در ');
  SetResourceString(@MSG_Except_SaveAttached              , 'خطا در ذخیره فایل ضمیمه شده به پیام');
  SetResourceString(@MSG_Except_CefNull                   , 'کامپوننت GlobalCEFApp در برنامه شما مقداردهی اولیه نشده است (DPR برنامه DEMO را بررسی کنید)');
  SetResourceString(@Text_System_memUse                   , 'مجموع حافظه استفاده شده توسط این برنامه: ');
  SetResourceString(@Text_System_memTot                   , 'کل حافظه سیستم: ');
  SetResourceString(@Text_System_memFree                  , 'حافظه فیزیکی موجود: ');
  SetResourceString(@Text_System_memLoad                  , 'بار حافظه: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'تنظیمات LAN');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'نوع:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'سرور:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'پروتکل:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'پورت:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'نام کاربری:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'رمز عبور:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'اسکریپت تنظیم خودکار:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'عدم استفاده از پروکسی برای آدرس‌ها: (از نقطه‌ویرگول برای جدا کردن موارد استفاده کنید)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'حداکثر اتصالات برای هر پروکسی:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' سربرگ سفارشی: ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'نام "متغیر":');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'مقدار "متغیر":');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'ذخیره');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'لغو');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'آیا مطمئن هستید که می‌خواهید این داده‌ها را به‌روزرسانی کنید؟');
end;

procedure TTranslatorInject.LanguageItalian;
begin
  //Suggestion --> enricogaggero 14/09/2024
	SetResourceString(@MSG_CONFIGCEF_EXCEPTNOTFOUNDPATH , 'NON È POSSIBILE ESEGUIRE QUESTA OPERAZIONE DOPO CHE IL COMPONENTE È STATO INIZIALIZZATO');
	SetResourceString(@MSG_CONFIGCEF_EXCEPTCONNECTION , 'ERRORE DI CONNESSIONE CON IL COMPONENTE');
	SetResourceString(@MSG_CONFIGCEF_EXCEPTBROWSE , 'ERRORE NELLA CREAZIONE DEL BROWSER IN CEF');
	SetResourceString(@MSG_CONFIGCEF_EXCEPTCONNETSERV , 'NON SEI CONNESSO AL SERVER DI SERVIZIO');
	SetResourceString(@MSG_CONFIGCEF_EXCEPTCONSOLENAOPRONTO , 'LA CONSOLE NON HA ANCORA OTTENUTO I COMANDI PER INJECT JS');
	SetResourceString(@MSG_CONFIGCEF_EXCEPTVERSAOERRADA , 'LA TUA VERSIONE DI CEF4 NON È COMPATIBILE, AGGIORNA LA TUA LIBRERIA SU HTTPS://GITHUB.COM/SALVADORDF/CEF4DELPHI' + SLINEBREAK + 'VERSIONE RICHIESTA: %S' + SLINEBREAK + 'VERSIONE IDENTIFICATA: %S');
	SetResourceString(@MSG_EXCEPTSETBATTERYLOW , 'IL VALORE DEVE ESSERE COMPRESO TRA 5 E 90');
	SetResourceString(@MSG_EXCEPTONALTERQRCODESTYLE , 'NON È POSSIBILE ESEGUIRE QUESTA OPERAZIONE DOPO CHE IL COMPONENTE È STATO INIZIALIZZATO');
	SetResourceString(@MSG_EXCEPTCONFIGVERSAOCOMPINVALIDA , 'LA TUA VERSIONE DEL COMPONENTE TWPPCONNECT NON È COMPATIBILE CON L''ULTIMA VERSIONE DI JAVASCRIPT, AGGIORNA LA TUA LIBRERIA SU HTTP://WWW.TWPPCONNECT.COM.BR/');
	SetResourceString(@MSG_EXCEPTUPDATE , 'ERRORE DEL SERVER WEB. IMPOSSIBILE RICEVERE L''AGGIORNAMENTO JS.ABR');
	SetResourceString(@MSG_WARNINGDUPLICITYDETECTED , 'INVIO DELLO STESSO COMANDO IN UN INTERVALLO BREVE');
	SetResourceString(@MSG_EXCEPTJS_ABRUNKNOWN , 'RISPOSTA SCONOSCIUTA DA JS.ABR');
	SetResourceString(@MSG_EXCEPTNOTASSIGNEDONGETQRCODE , 'ONGETQRCODE NON È STATO DEFINITO');
	SetResourceString(@TEXT_FRMCLOSE_CAPTION , 'ATTENDERE.. TWPPCONNECT SI STA CHIUDENDO..');
	SetResourceString(@TEXT_FRMCLOSE_LABEL , 'TERMINAZIONE SICURA DI TUTTI I THREAD');
	SetResourceString(@TEXT_FRMCLOSE_WARNINGCLOSE , 'VUOI CHIUDERE L''APPLICAZIONE?');
	SetResourceString(@TEXT_FRMQRCODE_CAPTIONSTART , 'CARICAMENTO QRCODE...');
	SetResourceString(@TEXT_FRMQRCODE_CAPTIONSUCESS , 'ORA PUNTA IL TUO TELEFONO!');
	SetResourceString(@TEXT_FRMQRCODE_ONCLOSE , 'ANNULLARE LA CONNESSIONE AL SERVER DI SERVIZIO?');
	SetResourceString(@MSG_EXCEPTPHONENUMBERERROR , 'NUMERO NON VALIDO');
	SetResourceString(@MSG_EXCEPTALTERDESIGNER , 'NON È POSSIBILE MODIFICARE IN MODALITÀ DESIGNER');
	SetResourceString(@MSG_EXCEPTALTERINICIALIZED , 'IL METODO NON PUÒ ESSERE MODIFICATO DOPO L''INIZIALIZZAZIONE DI TWPPCONNECT');
	SetResourceString(@MSG_EXCEPTCONTACTNOTFOUND , 'NON CI SONO CONTATTI DA ESPORTARE');
	SetResourceString(@MSG_EXCEPTCONTACTSAVEFILE , 'IMPOSSIBILE SALVARE I CONTATTI SU %S');
	SetResourceString(@MSG_EXCEPTERRORLOCATEFORM , 'ERRORE NEL LOCALIZZARE IL FORM');
	SetResourceString(@MSG_EXCEPTPATH , 'IL PERCORSO %S NON È VALIDO');
	SetResourceString(@MSG_EXCEPTGLOBALCEF , 'LA CLASSE GLOBALCEF NON È STATA DEFINITA IN DPR');
	SetResourceString(@MSG_WARNINGCLOSING , 'ATTENDERE... CHIUSURA DELL''APPLICAZIONE');
	SetResourceString(@MSG_WARNINGERRORFILE , 'ERRORE SUL FILE SELEZIONATO (%S)');
	SetResourceString(@MSG_EXCEPTMISC , 'ERRORE SCONOSCIUTO');
	SetResourceString(@TEXT_FRMCONSOLE_CAPTION , 'COMPONENTE TWPPCONNECT BRASILE');
	SetResourceString(@TEXT_FRMCONSOLE_LBLMSG , 'ATTENDERE .. INIZIALIZZAZIONE DI TWPPCONNECT');
	SetResourceString(@MSG_WARNINGCLASSUNKNOWN , 'CLASSE SCONOSCIUTA');
	SetResourceString(@MSG_EXCEPTLIBEAY32DLL , 'IL TUO COMPUTER NON HA LE DLL "LIBEAY32.DLL" E "SSLEAY32.DLL". PER CONTINUARE, COPIA LE DLL NELLA CARTELLA DI SISTEMA O NELLA DIRECTORY DELL''APPLICAZIONE.');
	SetResourceString(@TEXT_VCARD_COMMENTS1 , 'ESPORTATO DAL COMPONENTE TWPPCONNECT IN: ');
	SetResourceString(@TEXT_VCARD_COMMENTS2 , 'CONTATTO SILENZIATO');
	SetResourceString(@TEXT_VCARD_COMMENTS3 , 'CATTURATO IN: ');
	SetResourceString(@MSG_WARNINGQRCODESTART1 , 'UNA SESSIONE PRECEDENTE È ANCORA IN CORSO, RIPROVA PIÙ TARDI');
	SetResourceString(@TEXT_STATUS_SERV_INITIALIZED , 'TWPPCONNECT CONNESSO CON SUCCESSO AL SERVER DI SERVIZIO');
	SetResourceString(@TEXT_STATUS_SERV_INITIALIZING , 'INIZIALIZZAZIONE DI TWPPCONNECT AL SERVER DI SERVIZIO');
	SetResourceString(@TEXT_STATUS_SERV_DISCONNECTED , 'NON CONNESSO AL SERVER DI SERVIZIO E TWPPCONNECT');
	SetResourceString(@TEXT_STATUS_SERV_DISCONNECTING , 'DISCONNESSO DAL SERVER DI SERVIZIO E TWPPCONNECT');
	SetResourceString(@TEXT_STATUS_SERV_CONNECTED , 'CONNESSO AL SERVER DI SERVIZIO');
	SetResourceString(@TEXT_STATUS_SERV_CONNECTEDDOWN , 'SESSIONE TERMINATA TRAMITE CELLULARE');
	SetResourceString(@TEXT_STATUS_SERV_CONNECTING , 'ATTENDERE, CONNESSIONE AL SERVER DI SERVIZIO');
	SetResourceString(@TEXT_STATUS_SERV_CONNECTINGNOPHONE , 'ERRORE DI CONNESSIONE, TELEFONO SPENTO');
	SetResourceString(@TEXT_STATUS_SERV_CONNECTINGREADERQR , 'IN ATTESA DELLA SCANSIONE DEL CODICE QR');
	SetResourceString(@TEXT_STATUS_SERV_TIMEOUT , 'IMPOSSIBILE CONNETTERSI (TIMEOUT)');
	SetResourceString(@TEXT_STATUS_SERV_DESTROYING , 'DISTRUGGENDO E CHIUDENDO TWPPCONNECT');
	SetResourceString(@TEXT_STATUS_SERV_DESTROY , 'TWPPCONNECT È STATO TERMINATO');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

	SetResourceString(@MSG_WARNINGNOTHINGTOSEND , 'NON C''È CONTENUTO DA INVIARE IN QUESTO MESSAGGIO');
	SetResourceString(@MSG_EXCEPT_DATA_TYPEOBJ , 'IL TIPO DI OGGETTO NON È COMPATIBILE');
	SetResourceString(@MSG_EXCEPT_DATA_CONNECTREPASS , 'IL TIPO DI DATASET NON HA UNA CONNESSIONE AL DATABASE');
	SetResourceString(@MSG_EXCEPT_DATA_CONNECTIONNULL , 'CONNESSIONE NON COLLEGATA');
	SetResourceString(@MSG_EXCEPT_ATRIBUICAOINVALIDA , 'ATTRIBUZIONE NON VALIDA (GIÀ IN USO DA UN ALTRO OGGETTO)');

	SetResourceString(@MSG_WARNINGDEVELOPER , 'AVVISO PER LO SVILUPPATORE (IDE)');
	SetResourceString(@TEXT_DEFAULTPATHDOWN , 'TWPPCONNECTATTACHMENT');
	SetResourceString(@TEXT_DEFAULTERROR , 'ERRORE NELLA CREAZIONE DELLA DIRECTORY IN ');
	SetResourceString(@MSG_EXCEPT_SAVEATTACHED , 'ERRORE NEL SALVATAGGIO DEL FILE ALLEGATO AL MESSAGGIO');
	SetResourceString(@MSG_EXCEPT_CEFNULL , 'IL COMPONENTE GLOBALCEFAPP NON È STATO INIZIALIZZATO NELL''APPLICAZIONE (CONTROLLA DPR DELL''APP DEMO)');
	SetResourceString(@TEXT_SYSTEM_MEMUSE , 'MEMORIA TOTALE UTILIZZATA DA QUESTA APPLICAZIONE: ');
	SetResourceString(@TEXT_SYSTEM_MEMTOT , 'MEMORIA TOTALE DI SISTEMA: ');
	SetResourceString(@TEXT_SYSTEM_MEMFREE , 'MEMORIA FISICA DISPONIBILE: ');
	SetResourceString(@TEXT_SYSTEM_MEMLOAD , 'CARICO DI MEMORIA: ');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_CAPTION , 'CONFIGURAZIONE LAN');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_PROXYTYPELBL , 'TIPO:');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_PROXYSERVERLBL , 'SERVER:');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_PRTOCOLLBL , 'PROTOCOLLO:');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_PROXYPORTLBL , 'PORTA:');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_PROXYUSERNAMELBL , 'NOME UTENTE:');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_PROXYPASSWORDLBL , 'PASSWORD:');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_PROXYSCRIPTURLLBL , 'SCRIPT DI CONFIGURAZIONE AUTOMATICA:');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_PROXYBYPASSLISTLBL , 'NON USARE PROXY PER GLI INDIRIZZI: (USA I PUNTI E VIRGOLA PER SEPARARE LE VOCI)');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_MAXCONNECTIONSPERPROXYLBL , 'CONNESSIONI MASSIME PER PROXY:');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_GROUPBOX2 , ' INTESTAZIONE PERSONALIZZATA: ');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_HEADERNAMELBL , 'NOME "VARIABILE":');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_HEADERVALUELBL , 'VALORE "VARIABILE":');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_BNTOK , 'SALVA');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_BNTCANCEL , 'RINUNCIA');
	SetResourceString(@TEXT_FRMCONFIGNETWORK_QUESTIONSAVE , 'CONFERMA L''AGGIORNAMENTO DI QUESTI DATI ?');
end;

procedure TTranslatorInject.LanguageGerman;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'Es ist nicht möglich, diese Operation auszuführen, nachdem die Komponente initialisiert wurde');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'Fehler bei der Verbindung mit der Komponente');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'Fehler beim Erstellen des Browsers in CEF');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'Sie sind nicht mit dem Dienstserver verbunden');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'Die Konsole hat die Befehle für INJECT JS noch nicht erhalten');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'Ihre CEF4-Version ist nicht kompatibel, bitte aktualisieren Sie Ihre Bibliothek unter https://github.com/salvadordf/CEF4Delphi' + slinebreak + 'Erforderliche Version: %s' + slinebreak + 'Erkannte Version: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'Der Wert muss zwischen 5 und 90 liegen');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'Es ist nicht möglich, diese Operation auszuführen, nachdem die Komponente initialisiert wurde');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'Ihre Version der TWPPConnect-Komponente ist nicht kompatibel mit der neuesten JavaScript-Version, bitte aktualisieren Sie Ihre Bibliothek unter http://www.TWPPConnect.com.br/');
  SetResourceString(@MSG_ExceptUpdate                     , 'WEB-Serverfehler. JS.ABR-Update kann nicht empfangen werden');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'Senden des gleichen Befehls in kurzer Zeit');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'Unbekannte JS.ABR-Antwort');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode wurde nicht definiert');
  SetResourceString(@Text_FrmClose_Caption                , 'Warten Sie.. TWPPConnect wird beendet..');
  SetResourceString(@Text_FrmClose_Label                  , 'Beenden aller Threads sicher');
  SetResourceString(@Text_FrmClose_WarningClose           , 'Möchten Sie die Anwendung schließen?');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'QRCode wird geladen...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'Zeigen Sie jetzt Ihr Telefon!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'Verbindung zum Dienstserver abbrechen?');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'Ungültige Nummer');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'Es ist nicht möglich, im Designermodus zu ändern');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'Methode kann nicht geändert werden, nachdem TWPPConnect initialisiert wurde');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'Es gibt keine Kontakte zum Exportieren');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'Kontakte können nicht unter %s gespeichert werden');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'Fehler beim Auffinden des Formulars');
  SetResourceString(@MSG_ExceptPath                       , 'Der Pfad %s ist ungültig');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'Die GLOBALCEF-Klasse wurde im DPR nicht definiert');
  SetResourceString(@MSG_WarningClosing                   , 'Warten Sie... Anwendung wird geschlossen');
  SetResourceString(@MSG_WarningErrorFile                 , 'Fehler bei der ausgewählten Datei (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'Unbekannter Fehler');
  SetResourceString(@Text_FrmConsole_Caption              , 'TWPPConnect-Komponente Brasilien');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'Warten Sie .. Initialisiere TWPPConnect');
  SetResourceString(@MSG_WarningClassUnknown              , 'Unbekannte Klasse');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'Auf Ihrem Computer fehlen die DLLs "libeay32.dll" und "ssleay32.dll". Um fortzufahren, kopieren Sie die DLLs in den Systemordner oder das Anwendungsverzeichnis.');
  SetResourceString(@Text_Vcard_Comments1                 , 'Exportiert von der TWPPConnect-Komponente in: ' );
  SetResourceString(@Text_Vcard_Comments2                 , 'Kontakt wurde stummgeschaltet');
  SetResourceString(@Text_Vcard_Comments3                 , 'Erfasst in: ');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'Eine vorherige Sitzung läuft noch, bitte versuchen Sie es später erneut');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect erfolgreich mit dem Dienstserver verbunden');
  SetResourceString(@Text_Status_Serv_Initializing        , 'TWPPConnect wird mit dem Dienstserver initialisiert');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'Nicht mit dem Dienstserver und TWPPConnect verbunden');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'Vom Dienstserver und TWPPConnect getrennt');
  SetResourceString(@Text_Status_Serv_Connected           , 'Mit dem Dienstserver verbunden');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'Sitzung über Mobilgerät beendet');
  SetResourceString(@Text_Status_Serv_Connecting          , 'Warten, Verbindung zum Dienstserver wird hergestellt');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'Verbindungsfehler, Telefon ist ausgeschaltet');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'Warten auf QR-Code-Scan');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'Verbindung nicht möglich (Zeitüberschreitung)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'TWPPConnect wird zerstört und geschlossen');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect wurde beendet');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'Es gibt keinen Inhalt zum Senden in dieser Nachricht');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'Objekttyp ist nicht kompatibel');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'Der DataSet-Typ hat keine Datenbankverbindung');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'Nicht verbundene Verbindung');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'Ungültige Zuordnung (bereits von einem anderen Objekt verwendet)');

  SetResourceString(@MSG_WarningDeveloper                 , 'Entwicklerhinweis (IDE)');
  SetResourceString(@Text_DefaultPathDown                 , 'TWPPConnectAttachment');
  SetResourceString(@Text_DefaultError                    , 'Fehler beim Erstellen des Verzeichnisses in ');
  SetResourceString(@MSG_Except_SaveAttached              , 'Fehler beim Speichern der an die Nachricht angehängten Datei');
  SetResourceString(@MSG_Except_CefNull                   , 'Die Komponente GlobalCEFApp wurde in Ihrer Anwendung nicht initialisiert (Überprüfen Sie das DPR der DEMO-App)');
  SetResourceString(@Text_System_memUse                   , 'Gesamtspeicher, der von dieser Anwendung verwendet wird: ');
  SetResourceString(@Text_System_memTot                   , 'Gesamtsystemspeicher: ');
  SetResourceString(@Text_System_memFree                  , 'Verfügbarer physischer Speicher: ');
  SetResourceString(@Text_System_memLoad                  , 'Speicherauslastung: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'LAN-Konfiguration');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'Typ:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'Server:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'Protokoll:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'Port:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'Benutzername:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'Passwort:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'Automatisches Konfigurationsskript:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'Keine Proxy-Adressen: (Verwenden Sie Semikolons, um Einträge zu trennen)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'Maximale Verbindungen pro Proxy:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' Benutzerdefinierte Kopfzeile: ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'Name "Variable":');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'Wert "Variable":');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'Speichern');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'Abbrechen');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'Möchten Sie diese Einstellungen wirklich anwenden?');
end;


procedure TTranslatorInject.LanguageFrench;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'Il est impossible d''effectuer cette opération après l''initialisation du composant');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'Erreur de connexion avec le composant');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'Erreur lors de la création du navigateur dans CEF');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'Vous n''êtes pas connecté au serveur de service');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'La console n''a pas encore obtenu les commandes pour INJECT JS');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'Votre version de CEF4 n''est pas compatible, veuillez mettre à jour votre bibliothèque sur https://github.com/salvadordf/CEF4Delphi' + slinebreak + 'Version requise : %s' + slinebreak + 'Version identifiée : %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'La valeur doit être comprise entre 5 et 90');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'Il est impossible d''effectuer cette opération après l''initialisation du composant');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'Votre version du composant TWPPConnect n''est pas compatible avec la dernière version de JavaScript, veuillez mettre à jour votre bibliothèque sur http://www.TWPPConnect.com.br/');
  SetResourceString(@MSG_ExceptUpdate                     , 'Erreur du serveur WEB. Impossible de recevoir la mise à jour JS.ABR');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'Envoi de la même commande dans un intervalle court');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'Retour JS.ABR inconnu');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode n''a pas été défini');
  SetResourceString(@Text_FrmClose_Caption                , 'Attendez... TWPPConnect est en cours de fermeture...');
  SetResourceString(@Text_FrmClose_Label                  , 'Fermeture de tous les threads en toute sécurité');
  SetResourceString(@Text_FrmClose_WarningClose           , 'Voulez-vous fermer l''application ?');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'Chargement du QRCode...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'Scannez maintenant avec votre téléphone !');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'Annuler la connexion au serveur de service ?');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'Numéro invalide');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'Impossible de modifier en mode Designer');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'La méthode ne peut pas être modifiée après l''initialisation de TWPPConnect');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'Il n''y a pas de contacts à exporter');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'Impossible d''enregistrer les contacts dans %s');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'Erreur lors de la localisation du formulaire');
  SetResourceString(@MSG_ExceptPath                       , 'Le chemin %s est invalide');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'La classe GLOBALCEF n''a pas été définie dans le DPR');
  SetResourceString(@MSG_WarningClosing                   , 'Attendez... fermeture de l''application');
  SetResourceString(@MSG_WarningErrorFile                 , 'Erreur sur le fichier sélectionné (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'Erreur inconnue');
  SetResourceString(@Text_FrmConsole_Caption              , 'Composant TWPPConnect Brésil');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'Attendez... Initialisation de TWPPConnect');
  SetResourceString(@MSG_WarningClassUnknown              , 'Classe inconnue');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'Votre ordinateur ne possède pas les DLL "libeay32.dll" et "ssleay32.dll". Pour continuer, placez les DLL dans le dossier système ou dans le répertoire de l''application.');
  SetResourceString(@Text_Vcard_Comments1                 , 'Exporté depuis le composant TWPPConnect le : ' );
  SetResourceString(@Text_Vcard_Comments2                 , 'Contact mis en sourdine');
  SetResourceString(@Text_Vcard_Comments3                 , 'Capturé le : ');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'Une session précédente est encore en cours, veuillez réessayer plus tard');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect connecté avec succès au serveur de service');
  SetResourceString(@Text_Status_Serv_Initializing        , 'Initialisation de TWPPConnect au serveur de service');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'Non connecté au serveur de service et à TWPPConnect');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'Déconnecté du serveur de service et de TWPPConnect');
  SetResourceString(@Text_Status_Serv_Connected           , 'Connecté au serveur de service');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'Session terminée via mobile');
  SetResourceString(@Text_Status_Serv_Connecting          , 'Attendez, connexion au serveur de service en cours');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'Erreur de connexion, téléphone éteint');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'En attente de la numérisation du code QR');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'Impossible de se connecter (délai d''attente dépassé)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'Destruction et fermeture de TWPPConnect');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect a été terminé');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'Il n''y a pas de contenu à envoyer dans ce message');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'Le type d''objet n''est pas compatible');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'Le type DataSet n''a pas de connexion à la base de données');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'Connexion non liée');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'Attribution non valide (déjà utilisée par un autre objet)');

  SetResourceString(@MSG_WarningDeveloper                 , 'Avis pour le développeur (IDE)');
  SetResourceString(@Text_DefaultPathDown                 , 'TWPPConnectAttachment');
  SetResourceString(@Text_DefaultError                    , 'Erreur lors de la création du répertoire dans ');
  SetResourceString(@MSG_Except_SaveAttached              , 'Erreur lors de l''enregistrement du fichier joint au message');
  SetResourceString(@MSG_Except_CefNull                   , 'Le composant GlobalCEFApp n''a pas été initialisé dans votre application (Vérifiez le DPR de l''application DEMO)');
  SetResourceString(@Text_System_memUse                   , 'Mémoire totale utilisée par cette application : ');
  SetResourceString(@Text_System_memTot                   , 'Mémoire totale du système : ');
  SetResourceString(@Text_System_memFree                  , 'Mémoire physique disponible : ');
  SetResourceString(@Text_System_memLoad                  , 'Charge de mémoire : ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'Configuration LAN');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'Type :');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'Serveur :');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'Protocole :');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'Port :');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'Nom d''utilisateur :');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'Mot de passe :');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'Script de configuration automatique :');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'Ne pas utiliser de proxy pour les adresses : (utilisez des points-virgules pour séparer les entrées)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'Connexions maximales par proxy :');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' En-tête personnalisé : ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'Nom "Variable" :');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'Valeur "Variable" :');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'Sauvegarder');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'Annuler');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'Confirmez-vous la mise à jour de ces données ?');
end;

procedure TTranslatorInject.LanguageRussian;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'Невозможно выполнить эту операцию после инициализации компонента');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'Ошибка подключения к компоненту');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'Ошибка при создании браузера в CEF');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'Вы не подключены к сервисному серверу');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'Консоль еще не получила команды для INJECT JS');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'Ваша версия CEF4 несовместима, пожалуйста, обновите библиотеку по адресу https://github.com/salvadordf/CEF4Delphi' + slinebreak + 'Требуемая версия: %s' + slinebreak + 'Обнаруженная версия: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'Значение должно быть между 5 и 90');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'Невозможно выполнить эту операцию после инициализации компонента');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'Ваша версия компонента TWPPConnect несовместима с последней версией JavaScript, пожалуйста, обновите библиотеку на http://www.TWPPConnect.com.br/');
  SetResourceString(@MSG_ExceptUpdate                     , 'Ошибка веб-сервера. Невозможно получить обновление JS.ABR');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'Отправка одной и той же команды в короткий промежуток времени');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'Неизвестный ответ JS.ABR');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode не был определен');
  SetResourceString(@Text_FrmClose_Caption                , 'Подождите... TWPPConnect завершает работу...');
  SetResourceString(@Text_FrmClose_Label                  , 'Безопасное завершение всех потоков');
  SetResourceString(@Text_FrmClose_WarningClose           , 'Вы хотите закрыть приложение?');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'Загрузка QR-кода...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'Теперь наведите телефон!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'Отменить подключение к сервисному серверу?');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'Неверный номер');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'Невозможно изменить в режиме дизайнера');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'Метод не может быть изменен после инициализации TWPPConnect');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'Нет контактов для экспорта');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'Не удается сохранить контакты в %s');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'Ошибка при нахождении формы');
  SetResourceString(@MSG_ExceptPath                       , 'Путь %s недействителен');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'Класс GLOBALCEF не был определен в DPR');
  SetResourceString(@MSG_WarningClosing                   , 'Подождите... приложение закрывается');
  SetResourceString(@MSG_WarningErrorFile                 , 'Ошибка с выбранным файлом (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'Неизвестная ошибка');
  SetResourceString(@Text_FrmConsole_Caption              , 'Компонент TWPPConnect Бразилия');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'Подождите... Инициализация TWPPConnect');
  SetResourceString(@MSG_WarningClassUnknown              , 'Неизвестный класс');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'На вашем компьютере отсутствуют DLL "libeay32.dll" и "ssleay32.dll". Для продолжения скопируйте эти библиотеки в системную папку или в каталог приложения.');
  SetResourceString(@Text_Vcard_Comments1                 , 'Экспортировано из компонента TWPPConnect: ' );
  SetResourceString(@Text_Vcard_Comments2                 , 'Контакт был заглушен');
  SetResourceString(@Text_Vcard_Comments3                 , 'Захвачено в: ');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'Предыдущая сессия все еще активна, повторите попытку позже');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect успешно подключен к сервисному серверу');
  SetResourceString(@Text_Status_Serv_Initializing        , 'Инициализация TWPPConnect для сервисного сервера');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'Не подключено к сервисному серверу и TWPPConnect');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'Отключено от сервисного сервера и TWPPConnect');
  SetResourceString(@Text_Status_Serv_Connected           , 'Подключено к сервисному серверу');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'Сессия завершена через мобильное устройство');
  SetResourceString(@Text_Status_Serv_Connecting          , 'Подождите, идет подключение к сервисному серверу');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'Ошибка подключения, телефон выключен');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'Ожидание сканирования QR-кода');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'Не удалось подключиться (время ожидания истекло)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'TWPPConnect уничтожается и закрывается');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect завершил работу');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'В этом сообщении нет содержимого для отправки');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'Тип объекта несовместим');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'Тип DataSet не имеет подключения к базе данных');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'Отсутствует подключение');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'Недопустимое назначение (уже используется другим объектом)');

  SetResourceString(@MSG_WarningDeveloper                 , 'Уведомление для разработчика (IDE)');
  SetResourceString(@Text_DefaultPathDown                 , 'TWPPConnectAttachment');
  SetResourceString(@Text_DefaultError                    , 'Ошибка при создании каталога в ');
  SetResourceString(@MSG_Except_SaveAttached              , 'Ошибка при сохранении файла, прикрепленного к сообщению');
  SetResourceString(@MSG_Except_CefNull                   , 'Компонент GlobalCEFApp не был инициализирован в вашем приложении (проверьте DPR демонстрационного приложения)');
  SetResourceString(@Text_System_memUse                   , 'Общее количество памяти, используемой этим приложением: ');
  SetResourceString(@Text_System_memTot                   , 'Общая память системы: ');
  SetResourceString(@Text_System_memFree                  , 'Доступная физическая память: ');
  SetResourceString(@Text_System_memLoad                  , 'Загрузка памяти: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'Настройки LAN');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'Тип:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'Сервер:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'Протокол:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'Порт:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'Имя пользователя:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'Пароль:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'URL скрипта автоматической настройки:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'Не использовать прокси для адресов: (разделяйте записи точкой с запятой)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'Максимальное количество подключений на прокси:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' Настраиваемый заголовок: ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'Имя "переменной":');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'Значение "переменной":');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'Сохранить');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'Отмена');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'Подтверждаете обновление этих данных?');
end;

procedure TTranslatorInject.LanguageAfrikaans;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'Dit is nie moontlik om hierdie operasie uit te voer nadat die komponent geïnitialiseer is nie');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'Fout met verbinding met komponent');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'Fout met die skep van blaaier in CEF');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'Jy is nie met die diensbediener verbind nie');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'Die konsole het nog nie die opdragte vir INJECT JS ontvang nie');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'Jou CEF4-weergawe is nie versoenbaar nie, werk asseblief jou biblioteek op by https://github.com/salvadordf/CEF4Delphi' + slinebreak + 'Vereiste weergawe: %s' + slinebreak + 'Geïdentifiseerde weergawe: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'Waarde moet tussen 5 en 90 wees');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'Dit is nie moontlik om hierdie operasie uit te voer nadat die komponent geïnitialiseer is nie');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'Jou weergawe van die TWPPConnect-komponent is nie versoenbaar met die nuutste weergawe van JavaScript nie, werk asseblief jou biblioteek op by http://www.TWPPConnect.com.br/');
  SetResourceString(@MSG_ExceptUpdate                     , 'WEB-bedienerfout. Kan nie JS.ABR-opdatering ontvang nie');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'Stuur dieselfde opdrag binne ''n kort interval');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'Onbekende JS.ABR-antwoord');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode is nie gedefinieer nie');
  SetResourceString(@Text_FrmClose_Caption                , 'Wag... TWPPConnect is besig om te sluit...');
  SetResourceString(@Text_FrmClose_Label                  , 'Beëindiging van alle drade veilig');
  SetResourceString(@Text_FrmClose_WarningClose           , 'Wil jy die toepassing sluit?');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'QR-kode word gelaai...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'Rig jou telefoon nou!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'Kanselleer verbinding met diensbediener?');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'Ongeldige nommer');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'Dit is nie moontlik om in Ontwerper-modus te wysig nie');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'Metode kan nie verander word nadat TWPPConnect geïnitialiseer is nie');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'Geen kontakte om uit te voer nie');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'Kan nie kontakte stoor in %s nie');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'Fout met die opspoor van die FORM');
  SetResourceString(@MSG_ExceptPath                       , 'Die pad %s is ongeldig');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'GLOBALCEF-klas is nie in die DPR gedefinieer nie');
  SetResourceString(@MSG_WarningClosing                   , 'Wag... toepassing word gesluit');
  SetResourceString(@MSG_WarningErrorFile                 , 'Fout met geselekteerde lêer (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'Onbekende fout');
  SetResourceString(@Text_FrmConsole_Caption              , 'TWPPConnect-komponent van Brasilië');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'Wag... Inisialisering van TWPPConnect');
  SetResourceString(@MSG_WarningClassUnknown              , 'Onbekende klas');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'Jou rekenaar het nie die "libeay32.dll" en "ssleay32.dll" DLL-lêers nie. Om voort te gaan, kopieer die DLL-lêers na die stelselgids of toepassingsgids.');
  SetResourceString(@Text_Vcard_Comments1                 , 'Uitgevoer vanaf die TWPPConnect-komponent in: ');
  SetResourceString(@Text_Vcard_Comments2                 , 'Kontak is stilgemaak');
  SetResourceString(@Text_Vcard_Comments3                 , 'Vasgevang in: ');
  SetResourceString(@MSG_WarningQrCodeStart1              , '''n Vorige sessie is nog aan die gang, probeer asseblief later weer');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect suksesvol gekoppel aan diensbediener');
  SetResourceString(@Text_Status_Serv_Initializing        , 'Inisialisering van TWPPConnect met die diensbediener');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'Nie gekoppel aan diensbediener en TWPPConnect nie');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'Ontkoppel van diensbediener en TWPPConnect');
  SetResourceString(@Text_Status_Serv_Connected           , 'Gekoppel aan diensbediener');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'Sessie via mobiele toestel beëindig');
  SetResourceString(@Text_Status_Serv_Connecting          , 'Wag, besig om aan diensbediener te koppel');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'Fout met verbinding, telefoon is afgeskakel');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'Wag vir QR-kode-skandering');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'Kan nie koppel nie (Tyd verstryk)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'TWPPConnect word vernietig en gesluit');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect is beëindig');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'Daar is geen inhoud om in hierdie boodskap te stuur nie');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'Objekttipe is nie versoenbaar nie');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'DataSet-tipe het geen databasisverbinding nie');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'Verbinding nie gekoppel nie');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'Ongeldige toewysing (reeds in gebruik deur ''n ander objek)');

  SetResourceString(@MSG_WarningDeveloper                 , 'Ontwikkelaaraankondiging (IDE)');
  SetResourceString(@Text_DefaultPathDown                 , 'TWPPConnectAttachment');
  SetResourceString(@Text_DefaultError                    , 'Fout met die skep van gids in ');
  SetResourceString(@MSG_Except_SaveAttached              , 'Fout met die stoor van lêer wat aan die boodskap geheg is');
  SetResourceString(@MSG_Except_CefNull                   , 'GlobalCEFApp-komponent is nie in jou toepassing geïnitialiseer nie (Kyk na DPR van DEMO-toepassing)');
  SetResourceString(@Text_System_memUse                   , 'Totale geheue gebruik deur hierdie toepassing: ');
  SetResourceString(@Text_System_memTot                   , 'Totale stelselgeheue: ');
  SetResourceString(@Text_System_memFree                  , 'Beskikbare fisiese geheue: ');
  SetResourceString(@Text_System_memLoad                  , 'Geheuebelasting: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'LAN-konfigurasie');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'Tipe:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'Bediener:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'Protokol:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'Port:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'Gebruikersnaam:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'Wagwoord:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'Outomatiese konfigurasieskrip:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'Moenie proxy gebruik vir adresse nie: (gebruik kommas om inskrywings te skei)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'Maksimum verbindings per proxy:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' Pasgemaakte kopstuk: ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'Naam "Variabele":');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'Waarde "Variabele":');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'Stoor');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'Kanselleer');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'Bevestig u die opdatering van hierdie data?');
end;

procedure TTranslatorInject.LanguageHindi;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'इस ऑपरेशन को तब निष्पादित नहीं किया जा सकता जब घटक को प्रारंभ कर दिया गया हो');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'घटक से कनेक्ट करने में त्रुटि');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'CEF में ब्राउज़र बनाने में त्रुटि');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'आप सेवा सर्वर से कनेक्ट नहीं हैं');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'कंसोल ने अभी तक INJECT JS के लिए आदेश प्राप्त नहीं किए हैं');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'आपका CEF4 संस्करण संगत नहीं है, कृपया अपनी लाइब्रेरी https://github.com/salvadordf/CEF4Delphi पर अपडेट करें' + slinebreak + 'आवश्यक संस्करण: %s' + slinebreak + 'पहचाना गया संस्करण: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'मूल्य 5 और 90 के बीच होना चाहिए');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'इस ऑपरेशन को तब निष्पादित नहीं किया जा सकता जब घटक को प्रारंभ कर दिया गया हो');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'आपका TWPPConnect घटक संस्करण नवीनतम जावास्क्रिप्ट संस्करण के साथ संगत नहीं है, कृपया अपनी लाइब्रेरी http://www.TWPPConnect.com.br/ पर अपडेट करें');
  SetResourceString(@MSG_ExceptUpdate                     , 'वेब सर्वर त्रुटि। JS.ABR अपडेट प्राप्त करने में असमर्थ');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'कम समय में एक ही आदेश भेजना');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'अज्ञात JS.ABR प्रतिक्रिया');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode परिभाषित नहीं किया गया है');
  SetResourceString(@Text_FrmClose_Caption                , 'कृपया प्रतीक्षा करें.. TWPPConnect बंद हो रहा है..');
  SetResourceString(@Text_FrmClose_Label                  , 'सभी थ्रेड्स को सुरक्षित रूप से समाप्त करना');
  SetResourceString(@Text_FrmClose_WarningClose           , 'क्या आप एप्लिकेशन को बंद करना चाहते हैं?');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'QRCode लोड हो रहा है...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'अब अपना फोन इंगित करें!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'सेवा सर्वर से कनेक्शन रद्द करें?');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'अमान्य नंबर');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'डिज़ाइनर मोड में संपादन संभव नहीं है');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'TWPPConnect प्रारंभ होने के बाद विधि को संशोधित नहीं किया जा सकता है');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'निर्यात करने के लिए कोई संपर्क नहीं है');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'संपर्कों को %s में सहेजने में असमर्थ');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'फॉर्म का पता लगाने में त्रुटि');
  SetResourceString(@MSG_ExceptPath                       , 'पथ %s अमान्य है');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'GLOBALCEF क्लास को DPR में परिभाषित नहीं किया गया है');
  SetResourceString(@MSG_WarningClosing                   , 'कृपया प्रतीक्षा करें... एप्लिकेशन बंद हो रहा है');
  SetResourceString(@MSG_WarningErrorFile                 , 'चयनित फ़ाइल पर त्रुटि (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'अज्ञात त्रुटि');
  SetResourceString(@Text_FrmConsole_Caption              , 'TWPPConnect घटक ब्राज़ील');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'कृपया प्रतीक्षा करें.. TWPPConnect प्रारंभ हो रहा है');
  SetResourceString(@MSG_WarningClassUnknown              , 'अज्ञात क्लास');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'आपके कंप्यूटर में "libeay32.dll" और "ssleay32.dll" DLL फ़ाइलें नहीं हैं। जारी रखने के लिए, कृपया DLL फ़ाइलों को सिस्टम फ़ोल्डर या एप्लिकेशन निर्देशिका में कॉपी करें।');
  SetResourceString(@Text_Vcard_Comments1                 , 'TWPPConnect घटक से निर्यात किया गया: ');
  SetResourceString(@Text_Vcard_Comments2                 , 'संपर्क को म्यूट किया गया है');
  SetResourceString(@Text_Vcard_Comments3                 , 'पकड़ा गया: ');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'एक पिछला सत्र अभी भी चल रहा है, कृपया बाद में पुन: प्रयास करें');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect सेवा सर्वर से सफलतापूर्वक जुड़ा हुआ है');
  SetResourceString(@Text_Status_Serv_Initializing        , 'TWPPConnect सेवा सर्वर के साथ प्रारंभ कर रहा है');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'सेवा सर्वर और TWPPConnect से कनेक्ट नहीं है');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'सेवा सर्वर और TWPPConnect से डिस्कनेक्ट हो गया');
  SetResourceString(@Text_Status_Serv_Connected           , 'सेवा सर्वर से कनेक्ट किया गया');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'मोबाइल के माध्यम से सत्र समाप्त कर दिया गया है');
  SetResourceString(@Text_Status_Serv_Connecting          , 'कृपया प्रतीक्षा करें, सेवा सर्वर से कनेक्ट हो रहा है');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'कनेक्शन त्रुटि, फोन बंद है');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'QR कोड स्कैन करने की प्रतीक्षा कर रहा है');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'कनेक्ट नहीं हो सका (टाइमआउट)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'TWPPConnect को नष्ट कर बंद कर रहा है');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect समाप्त कर दिया गया है');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'इस संदेश में भेजने के लिए कोई सामग्री नहीं है');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'ऑब्जेक्ट प्रकार संगत नहीं है');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'डेटा सेट प्रकार में डेटाबेस कनेक्शन नहीं है');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'कनेक्शन लिंक नहीं है');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'अमान्य असाइनमेंट (पहले से ही किसी अन्य ऑब्जेक्ट द्वारा उपयोग में है)');

  SetResourceString(@MSG_WarningDeveloper                 , 'डेवलपर सूचना (IDE)');
  SetResourceString(@Text_DefaultPathDown                 , 'TWPPConnectAttachment');
  SetResourceString(@Text_DefaultError                    , 'निर्देशिका बनाने में त्रुटि: ');
  SetResourceString(@MSG_Except_SaveAttached              , 'संदेश से जुड़े फ़ाइल को सहेजने में त्रुटि');
  SetResourceString(@MSG_Except_CefNull                   , 'आपके एप्लिकेशन में GlobalCEFApp घटक प्रारंभ नहीं हुआ है (डेमो ऐप का DPR जांचें));');
  SetResourceString(@Text_System_memUse                   , 'इस एप्लिकेशन द्वारा उपयोग की गई कुल मेमोरी: ');
  SetResourceString(@Text_System_memTot                   , 'सिस्टम की कुल मेमोरी: ');
  SetResourceString(@Text_System_memFree                  , 'उपलब्ध भौतिक मेमोरी: ');
  SetResourceString(@Text_System_memLoad                  , 'मेमोरी लोड: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'LAN कॉन्फ़िगरेशन');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'प्रकार:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'सर्वर:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'प्रोटोकॉल:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'पोर्ट:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'यूज़रनेम:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'पासवर्ड:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'स्वचालित कॉन्फ़िगरेशन स्क्रिप्ट:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'इन पतों के लिए प्रॉक्सी का उपयोग न करें: (प्रविष्टियों को अलग करने के लिए सेमीकोलन का उपयोग करें)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'प्रति प्रॉक्सी अधिकतम कनेक्शन:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' कस्टम हेडर: ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , '"वैरिएबल" नाम:');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , '"वैरिएबल" मान:');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'सहेजें');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'रद्द करें');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'क्या आप वास्तव में इन सेटिंग्स को लागू करना चाहते हैं?');
end;

procedure TTranslatorInject.LanguageIndonesian;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'Tidak mungkin untuk melakukan operasi ini setelah komponen diinisialisasi');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'Kesalahan koneksi dengan komponen');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'Kesalahan membuat browser di CEF');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'Anda tidak terhubung ke server layanan');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'Konsol belum mendapatkan perintah untuk INJECT JS');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'Versi CEF4 Anda tidak kompatibel, silakan perbarui pustaka Anda di https://github.com/salvadordf/CEF4Delphi' + slinebreak + 'Versi yang diperlukan: %s' + slinebreak + 'Versi yang teridentifikasi: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'Nilai harus antara 5 dan 90');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'Tidak mungkin untuk melakukan operasi ini setelah komponen diinisialisasi');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'Versi komponen TWPPConnect Anda tidak kompatibel dengan versi terbaru JavaScript, silakan perbarui pustaka Anda di http://www.TWPPConnect.com.br/');
  SetResourceString(@MSG_ExceptUpdate                     , 'Kesalahan server WEB. Tidak dapat menerima pembaruan JS.ABR');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'Mengirim perintah yang sama dalam interval waktu yang singkat');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'Balasan JS.ABR tidak dikenal');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode belum didefinisikan');
  SetResourceString(@Text_FrmClose_Caption                , 'Tunggu.. TWPPConnect sedang ditutup..');
  SetResourceString(@Text_FrmClose_Label                  , 'Mengakhiri semua thread dengan aman');
  SetResourceString(@Text_FrmClose_WarningClose           , 'Apakah Anda ingin menutup aplikasi?');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'Memuat QRCode...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'Arahkan ponsel Anda sekarang!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'Batalkan koneksi server layanan?');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'Nomor tidak valid');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'Tidak mungkin untuk mengubah dalam Mode Desainer');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'Metode tidak dapat diubah setelah TWPPConnect diinisialisasi');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'Tidak ada kontak untuk diekspor');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'Tidak dapat menyimpan kontak ke %s');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'Kesalahan menemukan FORMULIR');
  SetResourceString(@MSG_ExceptPath                       , 'Jalur %s tidak valid');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'Kelas GLOBALCEF tidak didefinisikan dalam DPR');
  SetResourceString(@MSG_WarningClosing                   , 'Tunggu... menutup aplikasi');
  SetResourceString(@MSG_WarningErrorFile                 , 'Kesalahan pada file yang dipilih (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'Kesalahan tidak dikenal');
  SetResourceString(@Text_FrmConsole_Caption              , 'Komponen TWPPConnect Brasil');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'Tunggu.. Memulai TWPPConnect');
  SetResourceString(@MSG_WarningClassUnknown              , 'Kelas tidak dikenal');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'Komputer Anda tidak memiliki DLL "libeay32.dll" dan "ssleay32.dll". Untuk melanjutkan, letakkan DLL di folder sistem atau di direktori aplikasi.');
  SetResourceString(@Text_Vcard_Comments1                 , 'Diekspor dari Komponen TWPPConnect pada: ' );
  SetResourceString(@Text_Vcard_Comments2                 , 'Kontak telah dibisukan');
  SetResourceString(@Text_Vcard_Comments3                 , 'Ditangkap pada: ');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'Sesi sebelumnya masih berjalan, silakan coba lagi nanti');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect berhasil terhubung ke server layanan');
  SetResourceString(@Text_Status_Serv_Initializing        , 'Memulai TWPPConnect ke server layanan');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'Tidak terhubung ke server layanan dan TWPPConnect');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'Terputus dari server layanan dan TWPPConnect');
  SetResourceString(@Text_Status_Serv_Connected           , 'Terhubung ke server layanan');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'Sesi dihentikan melalui ponsel');
  SetResourceString(@Text_Status_Serv_Connecting          , 'Tunggu, menghubungkan ke server layanan');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'Kesalahan koneksi, telepon dimatikan');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'Menunggu pemindaian kode QR');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'Tidak dapat terhubung (Timeout)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'Menghancurkan dan menutup TWPPConnect');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect telah dihentikan');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'Tidak ada konten untuk dikirim dalam pesan ini');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'Tipe objek tidak kompatibel');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'Tipe DataSet Tidak Memiliki Koneksi Database');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'Koneksi tidak terhubung');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'Penugasan tidak valid (sudah digunakan oleh objek lain)');

  SetResourceString(@MSG_WarningDeveloper                 , 'Pemberitahuan pengembang (IDE)');
  SetResourceString(@Text_DefaultPathDown                 , 'LampiranTWPPConnect');
  SetResourceString(@Text_DefaultError                    , 'Kesalahan membuat direktori di ');
  SetResourceString(@MSG_Except_SaveAttached              , 'Kesalahan menyimpan file yang dilampirkan ke pesan');
  SetResourceString(@MSG_Except_CefNull                   , 'Komponen GlobalCEFApp belum diinisialisasi di aplikasi Anda (Periksa DPR aplikasi DEMO)');
  SetResourceString(@Text_System_memUse                   , 'Total memori yang digunakan oleh aplikasi ini: ');
  SetResourceString(@Text_System_memTot                   , 'Total memori sistem: ');
  SetResourceString(@Text_System_memFree                  , 'Memori fisik yang tersedia: ');
  SetResourceString(@Text_System_memLoad                  , 'Beban memori: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'Konfigurasi LAN');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'Tipe:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'Server:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'Protokol:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'Port:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'Nama Pengguna:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'Kata Sandi:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'Skrip Konfigurasi Otomatis:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'Jangan gunakan proxy untuk alamat: (gunakan titik koma untuk memisahkan entri)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'Koneksi maksimum per proxy:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' Header khusus: ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'Nama "Variabel":');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'Nilai "Variabel":');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'Simpan');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'Batal');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'Apakah Anda yakin ingin memperbarui data ini?');
end;

procedure TTranslatorInject.LanguageTurkish;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'Bileşen başlatıldıktan sonra bu işlemi gerçekleştirmek mümkün değildir');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'Bileşen ile bağlantı hatası');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'CEF içinde tarayıcı oluşturma hatası');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'Hizmet sunucusuna bağlı değilsiniz');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'Konsol, INJECT JS için komutları henüz almadı');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'CEF4 sürümünüz uyumlu değil, lütfen kütüphanenizi şu adreste güncelleyin: https://github.com/salvadordf/CEF4Delphi' + slinebreak + 'Gerekli sürüm: %s' + slinebreak + 'Tanımlanan sürüm: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'Değer 5 ile 90 arasında olmalıdır');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'Bileşen başlatıldıktan sonra bu işlemi gerçekleştirmek mümkün değildir');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'TWPPConnect bileşeninizin sürümü, en son JavaScript sürümü ile uyumlu değil, lütfen kütüphanenizi şu adreste güncelleyin: http://www.TWPPConnect.com.br/');
  SetResourceString(@MSG_ExceptUpdate                     , 'WEB sunucu hatası. JS.ABR güncellemesi alınamadı');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'Kısa bir süre içinde aynı komutu gönderme');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'Bilinmeyen JS.ABR yanıtı');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode tanımlanmadı');
  SetResourceString(@Text_FrmClose_Caption                , 'Bekleyin.. TWPPConnect Kapatılıyor..');
  SetResourceString(@Text_FrmClose_Label                  , 'Tüm dizileri güvenli bir şekilde kapatma');
  SetResourceString(@Text_FrmClose_WarningClose           , 'Uygulamayı kapatmak istiyor musunuz?');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'QRCode Yükleniyor...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'Telefonunuzu şimdi yönlendirin!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'Hizmet sunucusuna bağlantıyı iptal etmek mi istiyorsunuz?');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'Geçersiz Numara');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'Tasarımcı Modunda değişiklik yapmak mümkün değil');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'TWPPConnect başlatıldıktan sonra yöntem değiştirilemez');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'Dışa aktarılacak kişi yok');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'Kişileri %s konumuna kaydetmek mümkün değil');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'FORM bulunamadı hatası');
  SetResourceString(@MSG_ExceptPath                       , 'Yol %s geçersiz');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'GLOBALCEF sınıfı DPR''de tanımlanmadı');
  SetResourceString(@MSG_WarningClosing                   , 'Bekleyin... uygulama kapanıyor');
  SetResourceString(@MSG_WarningErrorFile                 , 'Seçilen dosyada hata (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'Bilinmeyen hata');
  SetResourceString(@Text_FrmConsole_Caption              , 'TWPPConnect Bileşeni Brezilya');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'Bekleyin.. TWPPConnect Başlatılıyor');
  SetResourceString(@MSG_WarningClassUnknown              , 'Bilinmeyen sınıf');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'Bilgisayarınızda "libeay32.dll" ve "ssleay32.dll" DLL dosyaları yok. Devam etmek için DLL dosyalarını sistem klasörüne veya uygulama dizinine kopyalayın.');
  SetResourceString(@Text_Vcard_Comments1                 , 'TWPPConnect Bileşeninden dışa aktarıldı: ');
  SetResourceString(@Text_Vcard_Comments2                 , 'Kişi sessize alındı');
  SetResourceString(@Text_Vcard_Comments3                 , 'Yakalandı: ');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'Önceki bir oturum hala devam ediyor, lütfen daha sonra tekrar deneyin');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect hizmet sunucusuna başarıyla bağlandı');
  SetResourceString(@Text_Status_Serv_Initializing        , 'TWPPConnect hizmet sunucusuna başlatılıyor');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'Hizmet sunucusuna ve TWPPConnect''e bağlı değil');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'Hizmet sunucusundan ve TWPPConnect''ten bağlantı kesildi');
  SetResourceString(@Text_Status_Serv_Connected           , 'Hizmet sunucusuna bağlı');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'Oturum mobil cihazdan sonlandırıldı');
  SetResourceString(@Text_Status_Serv_Connecting          , 'Bekleyin, hizmet sunucusuna bağlanıyor');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'Bağlantı hatası, telefon kapalı');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'QR kodunu taramayı bekliyor');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'Bağlanılamadı (Zaman Aşımı)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'TWPPConnect yok ediliyor ve kapatılıyor');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect sonlandırıldı');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'Bu mesajda gönderilecek içerik yok');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'Nesne türü uyumlu değil');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'DataSet Türü Veritabanı Bağlantısına Sahip Değil');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'Bağlantı bağlantısız');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'Geçersiz atama (zaten başka bir nesne tarafından kullanılıyor)');

  SetResourceString(@MSG_WarningDeveloper                 , 'Geliştirici bildirimi (IDE)');
  SetResourceString(@Text_DefaultPathDown                 , 'TWPPConnectEkleri');
  SetResourceString(@Text_DefaultError                    , 'Dizin oluşturma hatası: ');
  SetResourceString(@MSG_Except_SaveAttached              , 'Mesaja eklenen dosya kaydedilirken hata oluştu');
  SetResourceString(@MSG_Except_CefNull                   , 'GlobalCEFApp bileşeni uygulamanızda başlatılmadı (DEMO uygulamasının DPR dosyasını kontrol edin)');
  SetResourceString(@Text_System_memUse                   , 'Bu uygulama tarafından kullanılan toplam bellek: ');
  SetResourceString(@Text_System_memTot                   , 'Sistem belleği toplamı: ');
  SetResourceString(@Text_System_memFree                  , 'Kullanılabilir fiziksel bellek: ');
  SetResourceString(@Text_System_memLoad                  , 'Bellek yükü: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'LAN yapılandırması');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'Tür:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'Sunucu:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'Protokol:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'Bağlantı Noktası:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'Kullanıcı Adı:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'Şifre:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'Otomatik Yapılandırma Betiği:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'Bu adresler için proxy kullanma: (girişleri ayırmak için noktalı virgül kullanın)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'Proxy başına maksimum bağlantı:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' Özelleştirilmiş başlık: ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'Değişken Adı:');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'Değişken Değeri:');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'Kaydet');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'İptal');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'Bu ayarları uygulamak istediğinizden emin misiniz?');
end;

procedure TTranslatorInject.LanguageUrdu;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'کمیپننٹ کے انیشیالائز ہونے کے بعد یہ آپریشن نہیں کیا جا سکتا');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'کمیپننٹ سے کنکشن میں خرابی');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'CEF میں براؤزر بنانے میں خرابی');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'آپ سروس سرور سے جڑے نہیں ہیں');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'کنسول نے ابھی تک INJECT JS کے لیے کمانڈز نہیں حاصل کیے');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'آپ کا CEF4 ورژن مطابقت نہیں رکھتا، برائے مہربانی اپنی لائبریری کو اس پتہ پر اپ ڈیٹ کریں: https://github.com/salvadordf/CEF4Delphi' + slinebreak + 'ضروری ورژن: %s' + slinebreak + 'پہچانا گیا ورژن: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'قیمت 5 اور 90 کے درمیان ہونی چاہیے');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'کمیپننٹ کے انیشیالائز ہونے کے بعد یہ آپریشن نہیں کیا جا سکتا');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'آپ کے TWPPConnect کمیپننٹ کا ورژن جدید جاوا اسکرپٹ ورژن کے ساتھ مطابقت نہیں رکھتا، برائے مہربانی اپنی لائبریری کو اس پتہ پر اپ ڈیٹ کریں: http://www.TWPPConnect.com.br/');
  SetResourceString(@MSG_ExceptUpdate                     , 'ویب سرور کی خرابی۔ JS.ABR اپ ڈیٹ موصول نہیں ہو سکی');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'کم وقت میں ایک ہی کمانڈ بھیجنا');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'JS.ABR کا نامعلوم جواب');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode کی وضاحت نہیں کی گئی ہے');
  SetResourceString(@Text_FrmClose_Caption                , 'انتظار کریں.. TWPPConnect بند ہو رہا ہے..');
  SetResourceString(@Text_FrmClose_Label                  , 'تمام تھریڈز کو محفوظ طریقے سے ختم کیا جا رہا ہے');
  SetResourceString(@Text_FrmClose_WarningClose           , 'کیا آپ ایپلیکیشن بند کرنا چاہتے ہیں؟');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'QR کوڈ لوڈ ہو رہا ہے...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'اب اپنے فون کی نشاندہی کریں!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'سروس سرور کا کنکشن منسوخ کریں؟');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'غلط نمبر');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'ڈیزائنر موڈ میں ترمیم ممکن نہیں ہے');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'TWPPConnect کے انیشیالائز ہونے کے بعد طریقہ کار کو تبدیل نہیں کیا جا سکتا');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'برآمد کرنے کے لئے کوئی رابطے نہیں ہیں');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'رابطے %s میں محفوظ نہیں کیے جا سکتے');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'فارم کو تلاش کرنے میں خرابی');
  SetResourceString(@MSG_ExceptPath                       , 'راستہ %s غیر درست ہے');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'GLOBALCEF کلاس کو DPR میں وضاحت نہیں کی گئی ہے');
  SetResourceString(@MSG_WarningClosing                   , 'انتظار کریں... ایپلیکیشن بند ہو رہی ہے');
  SetResourceString(@MSG_WarningErrorFile                 , 'منتخب کردہ فائل میں خرابی (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'نامعلوم خرابی');
  SetResourceString(@Text_FrmConsole_Caption              , 'TWPPConnect کمیپننٹ برازیل');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'انتظار کریں .. TWPPConnect شروع ہو رہا ہے');
  SetResourceString(@MSG_WarningClassUnknown              , 'نامعلوم کلاس');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'آپ کے کمپیوٹر میں "libeay32.dll" اور "ssleay32.dll" DLL فائلیں نہیں ہیں۔ جاری رکھنے کے لیے، ان DLL فائلوں کو سسٹم فولڈر یا ایپلیکیشن ڈائریکٹری میں کاپی کریں۔');
  SetResourceString(@Text_Vcard_Comments1                 , 'TWPPConnect کمیپننٹ سے برآمد کیا گیا: ' );
  SetResourceString(@Text_Vcard_Comments2                 , 'رابطہ خاموش کر دیا گیا ہے');
  SetResourceString(@Text_Vcard_Comments3                 , 'پکڑا گیا: ');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'پچھلا سیشن ابھی بھی جاری ہے، براہ کرم بعد میں دوبارہ کوشش کریں');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect کامیابی کے ساتھ سروس سرور سے جڑ گیا ہے');
  SetResourceString(@Text_Status_Serv_Initializing        , 'TWPPConnect کو سروس سرور کے ساتھ شروع کیا جا رہا ہے');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'سروس سرور اور TWPPConnect سے منسلک نہیں ہے');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'سروس سرور اور TWPPConnect سے منقطع ہو گیا ہے');
  SetResourceString(@Text_Status_Serv_Connected           , 'سروس سرور سے منسلک');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'سیشن موبائل کے ذریعہ ختم ہو گیا');
  SetResourceString(@Text_Status_Serv_Connecting          , 'انتظار کریں، سروس سرور سے جڑ رہا ہے');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'کنکشن میں خرابی، فون بند ہے');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'QR کوڈ اسکین کرنے کا انتظار کر رہا ہے');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'کنکشن نہیں ہو سکا (ٹائم آؤٹ)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'TWPPConnect کو ختم اور بند کیا جا رہا ہے');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect ختم کر دیا گیا ہے');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'اس پیغام میں بھیجنے کے لیے کوئی مواد نہیں ہے');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'آبجیکٹ کی قسم مطابقت نہیں رکھتی');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'ڈیٹا سیٹ کی قسم میں ڈیٹا بیس کنکشن نہیں ہے');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'کنکشن منسلک نہیں ہے');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'غلط اسائنمنٹ (پہلے ہی کسی اور آبجیکٹ کے ذریعہ استعمال میں ہے)');

  SetResourceString(@MSG_WarningDeveloper                 , 'ڈویلپر نوٹس (IDE)');
  SetResourceString(@Text_DefaultPathDown                 , 'TWPPConnectAttachment');
  SetResourceString(@Text_DefaultError                    , 'ڈائریکٹری بنانے میں خرابی: ');
  SetResourceString(@MSG_Except_SaveAttached              , 'پیغام میں منسلک فائل کو محفوظ کرنے میں خرابی');
  SetResourceString(@MSG_Except_CefNull                   , 'آپ کے ایپلیکیشن میں GlobalCEFApp کمیپننٹ انیشیالائز نہیں ہوا ہے (ڈیمو ایپ کا DPR چیک کریں)');
  SetResourceString(@Text_System_memUse                   , 'اس ایپلیکیشن کے ذریعہ استعمال کی جانے والی کل میموری: ');
  SetResourceString(@Text_System_memTot                   , 'سسٹم کی کل میموری: ');
  SetResourceString(@Text_System_memFree                  , 'دستیاب فزیکل میموری: ');
  SetResourceString(@Text_System_memLoad                  , 'میموری لوڈ: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'LAN کنفیگریشن');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'قسم:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'سرور:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'پروٹوکول:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'پورٹ:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'یوزر نیم:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'پاس ورڈ:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'خودکار ترتیب کا اسکرپٹ:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'ان پتوں کے لیے پراکسی استعمال نہ کریں: (اندراجات کو الگ کرنے کے لیے سیمی کولن کا استعمال کریں)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'پراکسی فی زیادہ سے زیادہ کنکشن:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' حسب ضرورت ہیڈر: ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'نام "متغیر":');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'قیمت "متغیر":');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'محفوظ کریں');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'منسوخ کریں');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'کیا آپ واقعی ان سیٹنگز کو لاگو کرنا چاہتے ہیں؟');
end;

procedure TTranslatorInject.LanguageBengali;
begin
  SetResourceString(@MSG_ConfigCEF_ExceptNotFoundPATH     , 'উপাদানটি ইনিশিয়ালাইজ করার পরে এই অপারেশনটি করা সম্ভব নয়');
  SetResourceString(@MSG_ConfigCEF_ExceptConnection       , 'উপাদানের সাথে সংযোগ করতে সমস্যা হয়েছে');
  SetResourceString(@MSG_ConfigCEF_ExceptBrowse           , 'CEF-এ ব্রাউজার তৈরি করতে সমস্যা হয়েছে');
  SetResourceString(@MSG_ConfigCEF_ExceptConnetServ       , 'আপনি সার্ভিস সার্ভারের সাথে সংযুক্ত নন');
  SetResourceString(@MSG_ConfigCEF_ExceptConsoleNaoPronto , 'কনসোল এখনও INJECT JS-এর জন্য কমান্ডগুলি পায়নি');
  SetResourceString(@MSG_ConfigCEF_ExceptVersaoErrada     , 'আপনার CEF4 সংস্করণ সামঞ্জস্যপূর্ণ নয়, দয়া করে আপনার লাইব্রেরিটি https://github.com/salvadordf/CEF4Delphi এ আপডেট করুন' + slinebreak + 'প্রয়োজনীয় সংস্করণ: %s' + slinebreak + 'শনাক্তকৃত সংস্করণ: %s');
  SetResourceString(@MSG_ExceptSetBatteryLow              , 'মান ৫ এবং ৯০ এর মধ্যে হতে হবে');
  SetResourceString(@MSG_ExceptOnAlterQrCodeStyle         , 'উপাদানটি ইনিশিয়ালাইজ করার পরে এই অপারেশনটি করা সম্ভব নয়');
  SetResourceString(@MSG_ExceptConfigVersaoCompInvalida   , 'আপনার TWPPConnect উপাদানের সংস্করণটি সর্বশেষ JavaScript সংস্করণের সাথে সামঞ্জস্যপূর্ণ নয়, দয়া করে আপনার লাইব্রেরিটি http://www.TWPPConnect.com.br/ এ আপডেট করুন');
  SetResourceString(@MSG_ExceptUpdate                     , 'ওয়েব সার্ভার ত্রুটি। JS.ABR আপডেট পেতে অক্ষম');
  SetResourceString(@MSG_WarningDuplicityDetected         , 'একই কমান্ড সংক্ষিপ্ত সময়ের মধ্যে পাঠানো হয়েছে');
  SetResourceString(@MSG_ExceptJS_ABRUnknown              , 'অজানা JS.ABR প্রতিক্রিয়া');
  SetResourceString(@MSG_ExceptNotAssignedOnGetQrCode     , 'OnGetQrCode নির্ধারিত হয়নি');
  SetResourceString(@Text_FrmClose_Caption                , 'অপেক্ষা করুন.. TWPPConnect বন্ধ হচ্ছে..');
  SetResourceString(@Text_FrmClose_Label                  , 'সমস্ত থ্রেড নিরাপদে বন্ধ করা হচ্ছে');
  SetResourceString(@Text_FrmClose_WarningClose           , 'আপনি কি অ্যাপ্লিকেশনটি বন্ধ করতে চান?');
  SetResourceString(@Text_FrmQRCode_CaptionStart          , 'QRCode লোড হচ্ছে...');
  SetResourceString(@Text_FrmQRCode_CaptionSucess         , 'এখন আপনার ফোন নির্দেশ করুন!');
  SetResourceString(@Text_FrmQRCode_OnCLose               , 'সার্ভিস সার্ভারের সাথে সংযোগ বাতিল করতে চান?');
  SetResourceString(@MSG_ExceptPhoneNumberError           , 'অবৈধ নম্বর');
  SetResourceString(@MSG_ExceptAlterDesigner              , 'ডিজাইনার মোডে পরিবর্তন করা সম্ভব নয়');
  SetResourceString(@MSG_ExceptAlterInicialized           , 'TWPPConnect ইনিশিয়ালাইজ করার পরে পদ্ধতি পরিবর্তন করা যাবে না');
  SetResourceString(@MSG_ExceptCOntactNotFound            , 'রপ্তানি করার জন্য কোন পরিচিতি নেই');
  SetResourceString(@MSG_ExceptCOntactSaveFile            , 'পরিচিতিগুলি %s এ সংরক্ষণ করা যাচ্ছে না');
  SetResourceString(@MSG_ExceptErrorLocateForm            , 'ফর্ম খুঁজে পেতে ত্রুটি');
  SetResourceString(@MSG_ExceptPath                       , 'পথ %s অবৈধ');
  SetResourceString(@MSG_ExceptGlobalCef                  , 'GLOBALCEF ক্লাসটি DPR-এ নির্ধারিত হয়নি');
  SetResourceString(@MSG_WarningClosing                   , 'অপেক্ষা করুন... অ্যাপ্লিকেশন বন্ধ হচ্ছে');
  SetResourceString(@MSG_WarningErrorFile                 , 'নির্বাচিত ফাইলে ত্রুটি (%s)');
  SetResourceString(@MSG_ExceptMisc                       , 'অজানা ত্রুটি');
  SetResourceString(@Text_FrmConsole_Caption              , 'TWPPConnect উপাদান ব্রাজিল');
  SetResourceString(@Text_FrmConsole_LblMsg               , 'অপেক্ষা করুন.. TWPPConnect ইনিশিয়ালাইজ হচ্ছে');
  SetResourceString(@MSG_WarningClassUnknown              , 'অজানা ক্লাস');
  SetResourceString(@MSG_Exceptlibeay32dll                , 'আপনার কম্পিউটারে "libeay32.dll" এবং "ssleay32.dll" DLL ফাইলগুলি নেই। চালিয়ে যেতে, এই DLL ফাইলগুলি সিস্টেম ফোল্ডারে বা অ্যাপ্লিকেশন ডিরেক্টরিতে রাখুন।');
  SetResourceString(@Text_Vcard_Comments1                 , 'TWPPConnect উপাদান থেকে রপ্তানি করা হয়েছে: ');
  SetResourceString(@Text_Vcard_Comments2                 , 'পরিচিতিটি নীরব করা হয়েছে');
  SetResourceString(@Text_Vcard_Comments3                 , 'ধরা হয়েছে: ');
  SetResourceString(@MSG_WarningQrCodeStart1              , 'পূর্বের সেশন এখনও চলছে, দয়া করে পরে আবার চেষ্টা করুন');
  SetResourceString(@Text_Status_Serv_Initialized         , 'TWPPConnect সফলভাবে সার্ভিস সার্ভারের সাথে সংযুক্ত হয়েছে');
  SetResourceString(@Text_Status_Serv_Initializing        , 'TWPPConnect সার্ভিস সার্ভারের সাথে ইনিশিয়ালাইজ করা হচ্ছে');
  SetResourceString(@Text_Status_Serv_Disconnected        , 'সার্ভিস সার্ভার এবং TWPPConnect-এর সাথে সংযুক্ত নয়');
  SetResourceString(@Text_Status_Serv_Disconnecting       , 'সার্ভিস সার্ভার এবং TWPPConnect থেকে সংযোগ বিচ্ছিন্ন হয়েছে');
  SetResourceString(@Text_Status_Serv_Connected           , 'সার্ভিস সার্ভারের সাথে সংযুক্ত');
  SetResourceString(@Text_Status_Serv_ConnectedDown       , 'মোবাইলের মাধ্যমে সেশন বন্ধ করা হয়েছে');
  SetResourceString(@Text_Status_Serv_Connecting          , 'অপেক্ষা করুন, সার্ভিস সার্ভারের সাথে সংযোগ হচ্ছে');
  SetResourceString(@Text_Status_Serv_ConnectingNoPhone   , 'সংযোগে ত্রুটি, ফোন বন্ধ রয়েছে');
  SetResourceString(@Text_Status_Serv_ConnectingReaderQR  , 'QR কোড স্ক্যান করার জন্য অপেক্ষা করা হচ্ছে');
  SetResourceString(@Text_Status_Serv_TimeOut             , 'সংযোগ করা সম্ভব নয় (সময় শেষ)');
  SetResourceString(@Text_Status_Serv_Destroying          , 'TWPPConnect ধ্বংস এবং বন্ধ করা হচ্ছে');
  SetResourceString(@Text_Status_Serv_Destroy             , 'TWPPConnect বন্ধ হয়ে গেছে');

  SetResourceString(@Text_Status_Serv_Rebooting           , 'Rebooting Chromium');
  SetResourceString(@Text_Status_Serv_IsWhatsAppWebReady  , 'WhatsAppWeb Chat Load Complete');
  SetResourceString(@Text_Status_Serv_IsReady             , 'Is Ready');

  SetResourceString(@MSG_WarningNothingtoSend             , 'এই বার্তায় পাঠানোর জন্য কোন সামগ্রী নেই');
  SetResourceString(@MSG_Except_Data_TypeObj              , 'অবজেক্টের ধরন সামঞ্জস্যপূর্ণ নয়');
  SetResourceString(@MSG_Except_DATA_ConnectRepass        , 'ডেটাসেট ধরনে ডাটাবেস সংযোগ নেই');
  SetResourceString(@MSG_Except_DATA_ConnectionNull       , 'সংযোগ নেই');
  SetResourceString(@MSG_Except_AtribuicaoInvalida        , 'অবৈধ অ্যাসাইনমেন্ট (অন্য অবজেক্ট দ্বারা ইতিমধ্যেই ব্যবহৃত হচ্ছে)');

  SetResourceString(@MSG_WarningDeveloper                 , 'ডেভেলপার নোটিস (IDE)');
  SetResourceString(@Text_DefaultPathDown                 , 'TWPPConnectAttachment');
  SetResourceString(@Text_DefaultError                    , 'ডিরেক্টরি তৈরি করতে ত্রুটি: ');
  SetResourceString(@MSG_Except_SaveAttached              , 'বার্তায় সংযুক্ত ফাইলটি সংরক্ষণ করতে ত্রুটি হয়েছে');
  SetResourceString(@MSG_Except_CefNull                   , 'আপনার অ্যাপ্লিকেশনে GlobalCEFApp উপাদান ইনিশিয়ালাইজ করা হয়নি (ডেমো অ্যাপ্লিকেশনের DPR পরীক্ষা করুন));');
  SetResourceString(@Text_System_memUse                   , 'এই অ্যাপ্লিকেশন দ্বারা ব্যবহৃত মোট মেমরি: ');
  SetResourceString(@Text_System_memTot                   , 'সিস্টেমের মোট মেমরি: ');
  SetResourceString(@Text_System_memFree                  , 'উপলব্ধ শারীরিক মেমরি: ');
  SetResourceString(@Text_System_memLoad                  , 'মেমরি লোড: ');
  SetResourceString(@Text_FrmConfigNetWork_Caption        , 'LAN কনফিগারেশন');
  SetResourceString(@Text_FrmConfigNetWork_ProxyTypeLbl   , 'ধরন:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyServerLbl , 'সার্ভার:');
  SetResourceString(@Text_FrmConfigNetWork_PrtocolLbl     , 'প্রোটোকল:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPortLbl   , 'পোর্ট:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyUsernameLbl           , 'ইউজারনেম:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyPasswordLbl           , 'পাসওয়ার্ড:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyScriptURLLbl          , 'স্বয়ংক্রিয় কনফিগারেশন স্ক্রিপ্ট:');
  SetResourceString(@Text_FrmConfigNetWork_ProxyByPassListLbl         , 'এই ঠিকানাগুলির জন্য প্রক্সি ব্যবহার করবেন না: (প্রবেশগুলি পৃথক করতে সেমিকোলন ব্যবহার করুন)');
  SetResourceString(@Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl  , 'প্রতি প্রক্সির সর্বাধিক সংযোগ:');
  SetResourceString(@Text_FrmConfigNetWork_GroupBox2                  , ' কাস্টম হেডার: ');
  SetResourceString(@Text_FrmConfigNetWork_HeaderNameLbl              , 'নাম "ভেরিয়েবল":');
  SetResourceString(@Text_FrmConfigNetWork_HeaderValueLbl             , 'মান "ভেরিয়েবল":');
  SetResourceString(@Text_FrmConfigNetWork_BntOK                      , 'সংরক্ষণ করুন');
  SetResourceString(@Text_FrmConfigNetWork_BntCancel                  , 'বাতিল');
  SetResourceString(@Text_FrmConfigNetWork_QuestionSave               , 'আপনি কি নিশ্চিতভাবে এই ডেটা আপডেট করতে চান?');
end;


procedure TTranslatorInject.SetTranslator(Const PLanguage: TLanguageInject);
begin
  LanguageDefault;
  case PLanguage of
     Tl_English     : LanguageEnglish;
     TL_Farsi       : LanguageFarsi;
     Tl_Espanol     : LanguageEspanol;
     Tl_Italian     : LanguageItalian;
     TL_German      : LanguageGerman;
     TL_French      : LanguageFrench;
     TL_Russian     : LanguageRussian;
     TL_Afrikaans   : LanguageAfrikaans;
     TL_Hindi       : LanguageHindi;
     TL_Indonesian  : LanguageIndonesian;
     TL_Turkish     : LanguageTurkish;
     TL_Urdu        : LanguageUrdu;
     TL_Bengali     : LanguageBengali;
  end;
end;

end.
