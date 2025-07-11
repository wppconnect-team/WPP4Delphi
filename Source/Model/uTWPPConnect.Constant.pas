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
    Owner.....: Mike W. Lustosa            - mikelustosa@gmail.com   - +55 81 9.9630-2385
    Developer.: Joathan Theiller           - jtheiller@hotmail.com   -
                Daniel Oliveira Rodrigues  - Dor_poa@hotmail.com     - +55 51 9.9155-9228
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
unit uTWPPConnect.Constant;

interface

Uses
  {$IFDEF FPC}
    Messages, SysUtils, typinfo
  {$else}
    Winapi.Messages, System.SysUtils, typinfo, REST.Json
  {$ENDIF};
Const
  //Uso GLOBAL
                                  //Version updates I=HIGH, II=MEDIUM, III=LOW, IV=VERY LOW
  TWPPConnectVersion              = '5.0.0.3'; //  10/07/2025
  CardContact                     = '@c.us';
  CardGroup                       = '@g.us';
  CardList                        = '@broadcast';
  NomeArquivoInject               = 'js.abr';//'wppconnect-wa.js';
  NomeArquivoIni                  = 'ConfTWPPConnect.ini';
  MsMaxFindJSinDesigner           = 15000;//15000;
  VersaoMinima_CF4_Major          = 78;
  VersaoMinima_CF4_Minor          = 3;
  VersaoMinima_CF4_Release        = 0;
  Versao0porCasas                 = 3;
  MinutosCOnsideradoObsoletooJS   = 50;
  Enter                           = sLineBreak;
  ConfigCEF_Path_Locales          = 'locales';
  ConfigCEF_Path_Cache            = 'cache';
  ConfigCEF_Path_UserData         = 'User Data';
  JsonOptionClassPadrao           = [joDateIsUTC, joDateFormatISO8601, joIgnoreEmptyStrings, joIgnoreEmptyArrays];
  //ConsoleRetornText_Disconect      = 'failed: WebSocket is closed before the connection is established';
  FrmConsole_Browser_ContextPhoneOff = '<div class="_1fpj- app-wrapper-web">';

  FrmConsole_Browser_Created            = WM_APP + $100;
  FrmConsole_Browser_Direto             = WM_APP + $101;
  //MARCELO JS.ABR CUSTOMIZADO Marcelo 09/05/2022

  TWPPConnectJS_JSUrlPadrao             = 'https://raw.githubusercontent.com/wppconnect-team/WPP4Delphi/main/Source/JS/js.abr';
  //TWPPConnectJS_JSUrlPadrao               = '';

  // Added by Aurino 21/01/2023 11:10:46
  TPPConnectJS_libeay32                 = 'https://github.com/wppconnect-team/WPP4Delphi/blob/main/Demo/BIN/libeay32.dll?raw=true';
  TPPConnectJS_ssleay32                 = 'https://github.com/wppconnect-team/WPP4Delphi/blob/main/Demo/BIN/ssleay32.dll?raw=true';
  TPPConnectJS_decryptFile              = 'https://github.com/wppconnect-team/WPP4Delphi/blob/main/Demo/BIN/decryptFile.dll?raw=true';

  //TWPPConnectJS_JSUrlPadrao             = '';
  TWPPConnectJS_JSLinhasMInimas         = 3000; //17726; //2400; //17726; //1400;
  FrmConsole_JS_RetornoVazio            = '{"result":[]}';
  FrmConsole_JS_Ignorar                 = '{"name":"getUnreadMessages","result":"{\"result\":[]}"}';
  FrmConsole_JS_Ignorar2                = '{"name":"getList","result":"{\"result\":[]}"}';

  //FrmConsole_JS_URL                     = 'https://web.whatsapp.com/?v=2.2405.0';
  //FrmConsole_JS_URL                     = 'https://web.whatsapp.com/?v=2.3000.1011682686';
  FrmConsole_JS_URL                     = 'https://web.whatsapp.com/';

  FrmConsole_JS_GetAllContacts          = 'window.WAPI.getAllContacts();';
  FrmConsole_JS_GetMyContacts           = 'window.WAPI.getMyContacts();'; //01/07/2023
  FrmConsole_JS_GetBatteryLevel         = ''; //'window.WAPI.getBatteryLevel();'; //Não Habilitar Função deprecated GetBatteryLevel
  FrmConsole_JS_GetMyNumber             = 'getMyNumber();';
  FrmConsole_JS_GetUnreadMessages       = 'window.WAPI.getUnreadMessages(includeMe="True", includeNotifications="True", use_unread_count="True");';
  //FrmConsole_JS_GetUnreadMessages       = '';

  //Marcelo 22/10/2023
  FrmConsole_JS_getWAVersion            = 'window.WAPI.getWAVersion();';
  FrmConsole_JS_GetTotalChatsUserRead   = 'TotalChatsUserRead();';

  FrmConsole_JS_GetAllChats             = 'window.WAPI.getAllChats();';
  FrmConsole_JS_checkDelivered          = 'window.WAPI.getDelivered();';
  //FrmConsole_JS_WEBmonitorQRCode        = 'var AQrCode = document.getElementsByTagName("canvas")[0].toDataURL("image/png");console.log(JSON.stringify({"name":"getQrCodeWEB","result":{AQrCode}}));';

  //Marcelo 05/05/2023
  FrmConsole_JS_WEBmonitorQRCode         = ' var canvas = document.getElementsByTagName("canvas")[0]; if (canvas) { var AQrCode = canvas.toDataURL("image/png"); var result = { AQrCode: AQrCode }; ' +
                                               'console.log(JSON.stringify({ name: "getQrCodeWEB", result: result }));} else {}';
                                               //'console.log(JSON.stringify({ name: "getQrCodeWEB", result: result }));} else {console.log("Canvas element not found.");}';

  //FrmConsole_JS_refreshOnlyQRCode       = 'interval = window.setInterval(async function(){new Promise((resolve, reject)=>{let all = []; all = document.querySelectorAll("button"); if(all[0]){ all[0].click() }})},60000)';
  //FrmConsole_JS_refreshOnlyQRCode       = ' interval = window.setInterval(async function() {new Promise((resolve, reject) =>{let all = []; all = document.querySelector("button"); if (all) { if (all.text.includes("recarregar")) { all.click() } } })}, 60000);';

  //Marcelo 05/05/2023
  FrmConsole_JS_refreshOnlyQRCode        = 'interval = window.setInterval(async function() { await new Promise((resolve, reject) => {let all = Array.from(document.querySelectorAll("button")); if (all[0]) {if (all.some(btn => btn.textContent.includes("recarregar")))' + ' {all[0].click();}}resolve();});}, 60000);';
  //FrmConsole_JS_monitorQRCode           = ''; //'var AQrCode = document.getElementsByTagName("canvas")[0].toDataURL("image/png");console.log(JSON.stringify({"name":"getQrCode","result":{AQrCode}}));';

  //Marcelo 05/05/2023
  FrmConsole_JS_monitorQRCode            = ' var canvas = document.getElementsByTagName("canvas")[0]; if (canvas) { var AQrCode = canvas.toDataURL("image/png"); var result = { AQrCode: AQrCode }; ' +
                                               'console.log(JSON.stringify({ name: "getQrCodeWEB", result: result }));} else {}';
                                               //'console.log(JSON.stringify({ name: "getQrCodeWEB", result: result }));} else {console.log("Canvas element not found.");}';


  (*'document.addEventListener("DOMContentLoaded", () => { ' +
    '  const observer = new MutationObserver(() => { ' +
    '    element = document.getElementById("pane-side"); ' +
    '    if (element) { ' +
    //'      injectScript("js/wa-js.js").then(() => { ' +
    '        console.log("isReady"); ' +
    //'        setTimeout(() => { ' +
    //'          console.log("inject"); ' +
    //'          console.log("cds inject"); ' +
    //'          injectScript("js/cds.js"); ' +
    //'        }, 5000); ' +
    //'      }); ' +

    '      observer.disconnect(); ' +
    '    } ' +
    '  }); ' +

    '  observer.observe(document.body, { ' +
    '    childList: true, ' +
    '    subtree: true, ' +
    '    }); ' +
    '  }) ';

    *)
  FrmConsole_JS_MonitorChatLoadComplete =
    'var observer;' + sLineBreak +
    '' + sLineBreak +

    'var waitForElement = setInterval(function () {' + sLineBreak +
    '  var targetElement = document.querySelector(''#pane-side''); // Altere o seletor conforme necessário' + sLineBreak +
    '' + sLineBreak +
    '  if (targetElement) {' + sLineBreak +
    '    clearInterval(waitForElement); // Para de verificar' + sLineBreak +
    '' + sLineBreak +

    '    if (observer) {' + sLineBreak +
    '      observer.disconnect();' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +

    '    observer = new IntersectionObserver(function (entries, obs) {' + sLineBreak +
    '      entries.forEach(function (entry) {' + sLineBreak +
    '        if (entry.isIntersecting) {' + sLineBreak +
    '          console.log(''IsWhatsAppWebReady'');' + sLineBreak +
    '          SetConsoleMessage("IsWhatsAppWebReady", JSON.stringify({IsWhatsAppWebReady: true})); ' + sLineBreak +
    '          obs.unobserve(entry.target); // Para observar só uma vez' + sLineBreak +
    '        }' + sLineBreak +
    '      });' + sLineBreak +
    '    }, {' + sLineBreak +
    '      threshold: 0.1' + sLineBreak +
    '    });' + sLineBreak +
    '' + sLineBreak +
    '    observer.observe(targetElement);' + sLineBreak +
    '  }' + sLineBreak +
    '}, 500); // Verifica a cada 500ms';

  FrmConsole_JS_DelayChat =
    ' var original = original || {}; ' +
    ' original._processMultipleMessages = require(''WAWebProcessMultipleMsgsAction'')._processMultipleMessages; ' +
    ' require(''WAWebProcessMultipleMsgsAction'')._processMultipleMessages = function (...args) { ' +
    ' return new Promise((resolve, reject) => { ' +
    ' setTimeout(() => { ' +
    ' original._processMultipleMessages.apply(this, args).then(resolve,reject); ' +
    ' }, 3000); ' +
    ' }); ' +
    ' };';



  FrmConsole_JS_Monitor_Received_Message_Socket =
    'function renameKeys(obj) {' + #13#10 +
    '    if (Array.isArray(obj)) {' + #13#10 +
    '        return obj.map(renameKeys);' + #13#10 +
    '    } else if (obj !== null && typeof obj === ''object'') {' + #13#10 +
    '        const newObj = {};' + #13#10 +
    '        for (const key in obj) {' + #13#10 +
    '            let newKey = key;' + #13#10 +
    '' + #13#10 +
    '            if (newKey.startsWith(''$$'')) {' + #13#10 +
    '                // $$* → RET*' + #13#10 +
    '                newKey = ''RET'' + newKey.slice(2);' + #13#10 +
    '            } else if (newKey.startsWith(''$'')) {' + #13#10 +
    '                // $* → RET*' + #13#10 +
    '                newKey = ''RET'' + newKey.slice(1);' + #13#10 +
    '            }' + #13#10 +
    '' + #13#10 +
    '            newObj[newKey] = renameKeys(obj[key]);' + #13#10 +
    '        }' + #13#10 +
    '        return newObj;' + #13#10 +
    '    }' + #13#10 +
    '    return obj;' + #13#10 +
    '}' + #13#10 +
    '' + #13#10 +
    '' + #13#10 +
    'function SetConsoleMessage2(jsName, resultValue, Message) {' + #13#10 +
    '    let parsedValue;' + #13#10 +
    '' + #13#10 +
    '    try {' + #13#10 +
    '        parsedValue = JSON.parse(resultValue);' + #13#10 +
    '    } catch (e) {' + #13#10 +
    '        console.error("Erro ao converter resultValue em JSON:", resultValue);' + #13#10 +
    '        return;' + #13#10 +
    '    }' + #13#10 +
    '' + #13#10 +
    '    const renamedResult = renameKeys(parsedValue);' + #13#10 +
    '    const renamedMessage = renameKeys(Message || {});' + #13#10 +
    '' + #13#10 +
    '    // Adiciona renamedMessage dentro do campo "message"' + #13#10 +
    '    var mergedInnerResult = {' + #13#10 +
    '        ...renamedResult,' + #13#10 +
    '        message: renamedMessage' + #13#10 +
    '    };' + #13#10 +
    '' + #13#10 +
    '    mergedInnerResult = JSON.stringify(mergedInnerResult);' + #13#10 +
    '' + #13#10 +
    '    const Obj = {' + #13#10 +
    '        name: jsName,' + #13#10 +
    '        result: ''{"result":'' + mergedInnerResult + ''}''' + #13#10 +
    '    };' + #13#10 +
    '' + #13#10 +
    '    console.log(JSON.stringify(Obj));' + #13#10 +
    '}' + #13#10 +
    '' + #13#10 +
    '' + #13#10 +
    'if (!window.decodeBackStanza) {' + #13#10 +
    '    window.decodeBackStanza = require("WAWap").decodeStanza;' + #13#10 +
    '}' + #13#10 +
    '' + #13#10 +
    'if (!window.decodeBack) {' + #13#10 +
    '    window.decodeBack = require("decodeProtobuf").decodeProtobuf;' + #13#10 +
    '}' + #13#10 +
    '' + #13#10 +
    'require("WAWap").decodeStanza = async (e, t) => {' + #13#10 +
    '    var result = await window.decodeBackStanza(e, t);' + #13#10 +
    '    //console.log(''\u001B[31m[RECEIVED]\u001B[0m'', result);' + #13#10 +
    '' + #13#10 +
    '    if (result?.tag === "message") {' + #13#10 +
    '        require("decodeProtobuf").decodeProtobuf = (a, b) => {' + #13#10 +
    '            var Message = window.decodeBack(a, b);' + #13#10 +
    '            if (Message?.extendedTextMessage || Message?.imageMessage || Message?.documentMessage || Message?.documentWithCaptionMessage ||' + #13#10 +
    '                Message?.audioMessage || Message?.videoMessage || Message?.stickerMessage || Message?.ptvMessage ||' + #13#10 +
    '                Message?.conversation || Message?.contactMessage || Message?.contactsArrayMessage ||' + #13#10 +
    '                Message?.buttonsMessage || Message?.buttonsResponseMessage ||' + #13#10 +
    '                Message?.pollCreationMessage || Message?.pollCreationMessageV2 || Message?.pollCreationMessageV3 || Message?.pollCreationMessageV4 || Message?.pollCreationMessageV5 ||' + #13#10 +
    '                Message?.productMessage || Message?.templateButtonReplyMessage || Message?.templateMessage || Message?.orderMessage ||' + #13#10 +
    '                Message?.viewOnceMessage || Message?.viewOnceMessage || Message?.viewOnceMessageV2 || Message?.viewOnceMessageV2Extension ||' + #13#10 +
    '                Message?.locationMessage || Message?.listMessage || Message?.interactiveMessage || Message?.interactiveResponseMessage) {' + #13#10 +

    '            if (result.content && Array.isArray(result.content)) { ' +
    '                for (let i = 0; i < result.content.length; i++) { ' +
    '                    if (result.content[i]?.content) { ' +
    '                        delete result.content[i].content; ' +
    '                    } ' +
    '                } ' +
    '            } ' +

    '                //console.log(''\u001B[33m[DECODE]\u001B[0m'', Message);' + #13#10 +
    '                SetConsoleMessage2("OnReceived_Message_Socket", JSON.stringify(result), Message);' + #13#10 +
    '            }' + #13#10 +
    '            return Message;' + #13#10 +
    '        };' + #13#10 +
    '    }' + #13#10 +
    '    return result;' + #13#10 +
    '};';


  (*FrmConsole_JS_Monitor_Received_Message_Socket2 =
    'function SetConsoleMessage3(jsName, resultValue) {' + sLineBreak +
    '    Obj = {' + sLineBreak +
    '        name: jsName,' + sLineBreak +
    //'        result: ''{"result":'' + resultValue + ''}''' + sLineBreak +
    '        result: ''{"result":'' + resultValue + ''}''' + #13#10 +
    '    }' + sLineBreak +
    '    console.log(JSON.stringify(Obj));' + sLineBreak +
    '};' + sLineBreak +
    '' + sLineBreak +
    'if (!window.parseMsgProto) {' + sLineBreak +
    '    window.parseMsgProto = require("WAWebE2EProtoParser").parseMsgProto;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    //'require("WAWebE2EProtoParser").parseMsgProto = async (e) => {' + sLineBreak +
    //'    var result = await window.parseMsgProto(e);' + sLineBreak +
    'require("WAWebE2EProtoParser").parseMsgProto = (e) => {' + sLineBreak +
    '    var result = window.parseMsgProto(e);' + sLineBreak +
    '    SetConsoleMessage3("OnReceived_Message_Socket2", JSON.stringify(result));' + sLineBreak +
    '    return result;' + sLineBreak +
    '};';*)

  FrmConsole_JS_Monitor_Received_Message_Socket2 =
    'function SetConsoleMessage3(jsName, resultValue) {' + sLineBreak +
    '    Obj = {' + sLineBreak +
    '        name: jsName,' + sLineBreak +
    '        result: ''{"result":'' + resultValue + ''}''' + sLineBreak +
    '    };' + sLineBreak +
    '    console.log(JSON.stringify(Obj));' + sLineBreak +
    '};' + sLineBreak +
    '' + sLineBreak +
    'if (!window.parseMsgProto) {' + sLineBreak +
    '    window.parseMsgProto = require("WAWebE2EProtoParser").parseMsgProto;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    'require("WAWebE2EProtoParser").parseMsgProto = (e) => {' + sLineBreak +
    '    var result = window.parseMsgProto(e);' + sLineBreak +
    '' + sLineBreak +
    '    try {' + sLineBreak +
    '        // Verifica se o campo ''from'' ou ''id.remote'' contém ''@newsletter''' + sLineBreak +
    '        const from = result?.from;' + sLineBreak +
    '        const remote = result?.id?.remote;' + sLineBreak +
    '' + sLineBreak +
    '        if (' + sLineBreak +
    '            (typeof from === ''string'' && from.includes(''@newsletter'')) ||' + sLineBreak +
    '            (typeof remote === ''string'' && remote.includes(''@newsletter''))' + sLineBreak +
    '        ) {' + sLineBreak +
    '            // Ignora mensagens de newsletter' + sLineBreak +
    '            return result;' + sLineBreak +
    '        }' + sLineBreak +
    '' + sLineBreak +
    '        SetConsoleMessage3("OnReceived_Message_Socket2", JSON.stringify(result));' + sLineBreak +
    '    } catch (err) {' + sLineBreak +
    '        console.error("Erro ao verificar mensagem:", err);' + sLineBreak +
    '    }' + sLineBreak +
    '' + sLineBreak +
    '    return result;' + sLineBreak +
    '};';



  (*FrmConsole_JS_Monitor_Received_Message_Socket =

      'function renameKeys(obj) {'#13#10 +
      '    if (Array.isArray(obj)) {'#13#10 +
      '        return obj.map(renameKeys);'#13#10 +
      '    } else if (obj !== null && typeof obj === ''object'') {'#13#10 +
      '        const newObj = {};'#13#10 +
      '        for (const key in obj) {'#13#10 +
      '            let newKey = key;'#13#10#13#10 +
      '            if (newKey.startsWith(''$$'')) {'#13#10 +
      '                newKey = ''RET'' + newKey.slice(2);'#13#10 +
      '            } else if (newKey.startsWith(''$'')) {'#13#10 +
      '                newKey = ''RET'' + newKey.slice(1);'#13#10 +
      '            }'#13#10#13#10 +
      '            newObj[newKey] = renameKeys(obj[key]);'#13#10 +
      '        }'#13#10 +
      '        return newObj;'#13#10 +
      '    }'#13#10 +
      '    return obj;'#13#10 +
      '}'#13#10#13#10 +

      'function SetConsoleMessage2(jsName, resultValue, Message) {'#13#10 +
      '    let parsedValue;'#13#10#13#10 +
      '    try {'#13#10 +
      '        parsedValue = JSON.parse(resultValue);'#13#10 +
      '    } catch (e) {'#13#10 +
      '        console.error("Erro ao converter resultValue em JSON:", resultValue);'#13#10 +
      '        return;'#13#10 +
      '    }'#13#10#13#10 +
      '    const renamedResult = renameKeys(parsedValue);'#13#10 +
      '    const renamedMessage = renameKeys(Message || {});'#13#10#13#10 +
      '    // Mescla os dois objetos dentro do subcampo "result"'#13#10 +


      '    var mergedInnerResult = {'#13#10 +
      '       ...renamedResult,'#13#10 +
      '       ...renamedMessage'#13#10 +
      '   };'#13#10#13#10 +
      '   mergedInnerResult = JSON.stringify(mergedInnerResult);'#13#10#13#10 +
      '   const Obj = {'#13#10 +
      '       name: jsName,'#13#10 +
      '       result: ''{"result":'' + mergedInnerResult + ''}'''#13#10 +
      '   };'#13#10#13#10 +
      '   console.log(JSON.stringify(Obj));' +





      'if (!window.decodeBackStanza) {'#13#10 +
      '    window.decodeBackStanza = require("WAWap").decodeStanza;'#13#10 +
      '}'#13#10#13#10 +
      'if (!window.decodeBack) {'#13#10 +
      '    window.decodeBack = require("decodeProtobuf").decodeProtobuf;'#13#10 +
      '}'#13#10#13#10 +
      'require("WAWap").decodeStanza = async (e, t) => {'#13#10 +
      '    var result = await window.decodeBackStanza(e, t);'#13#10 +
      '    //console.log(''\u001B[31m[RECEIVED]\u001B[0m'', result);'#13#10#13#10 +
      '    if (result?.tag === "message") {'#13#10 +
      '        require("decodeProtobuf").decodeProtobuf = (a, b) => {'#13#10 +
      '            var Message = window.decodeBack(a, b);'#13#10 +
      '            if (Message?.extendedTextMessage || Message?.imageMessage || Message?.documentMessage || Message?.documentWithCaptionMessage ||'#13#10 +
      '                Message?.audioMessage || Message?.videoMessage || Message?.stickerMessage || Message?.ptvMessage ||'#13#10 +
      '                Message?.conversation || Message?.contactMessage || Message?.contactsArrayMessage ||'#13#10 +
      '                Message?.buttonsMessage || Message?.buttonsResponseMessage ||'#13#10 +
      '                Message?.pollCreationMessage || Message?.pollCreationMessageV2 || Message?.pollCreationMessageV3 || Message?.pollCreationMessageV4 || Message?.pollCreationMessageV5 ||'#13#10 +
      '                Message?.productMessage || Message?.templateButtonReplyMessage || Message?.templateMessage || Message?.orderMessage ||'#13#10 +
      '                Message?.viewOnceMessage || Message?.viewOnceMessage || Message?.viewOnceMessageV2 || Message?.viewOnceMessageV2Extension ||'#13#10 +
      '                Message?.locationMessage || Message?.listMessage || Message?.interactiveMessage || Message?.interactiveResponseMessage) {'#13#10 +
      '                //console.log(''\u001B[33m[DECODE]\u001B[0m'', Message);'#13#10 +
      '                SetConsoleMessage2("OnReceived_Message_Socket", JSON.stringify(result), Message);'#13#10 +
      '            }'#13#10 +
      '            return Message;'#13#10 +
      '        };'#13#10 +
      '    }'#13#10 +
      '    return result;'#13#10 +
      '};';  *)



    (*'function renameKeys(obj) {'#13#10 +
    '    if (Array.isArray(obj)) {'#13#10 +
    '        return obj.map(renameKeys);'#13#10 +
    '    } else if (obj !== null && typeof obj === ''object'') {'#13#10 +
    '        const newObj = {};'#13#10 +
    '        for (const key in obj) {'#13#10 +
    '            const newKey = key.startsWith(''$'') ? key.replace(''$'', ''RET'') : key;'#13#10 +
    '            newObj[newKey] = renameKeys(obj[key]);'#13#10 +
    '        }'#13#10 +
    '        return newObj;'#13#10 +
    '    }'#13#10 +
    '    return obj;'#13#10 +
    '}'#13#10#13#10 +
    'function SetConsoleMessage2(jsName, resultValue) {'#13#10 +
    '    let parsedValue;'#13#10#13#10 +
    '    try {'#13#10 +
    '        parsedValue = JSON.parse(resultValue);'#13#10 +
    '    } catch (e) {'#13#10 +
    '        console.error("Erro ao converter resultValue em JSON:", resultValue);'#13#10 +
    '        return;'#13#10 +
    '    }'#13#10#13#10 +
    '    const renamedResult = renameKeys(parsedValue);'#13#10#13#10 +
    '    const Obj = {'#13#10 +
    '        name: jsName,'#13#10 +
    '        result: JSON.stringify({ result: renamedResult })'#13#10 +
    '    };'#13#10 +
    '    console.log(JSON.stringify(Obj));'#13#10 +
    '}'#13#10#13#10 +
    'if (!window.decodeBackStanza) {'#13#10 +
    '    window.decodeBackStanza = require("WAWap").decodeStanza'#13#10 +
    '}'#13#10#13#10 +
    'require("WAWap").decodeStanza = async (e, t) => {'#13#10 +
    '    const result = await window.decodeBackStanza(e, t)'#13#10 +
    '    /*console.log(''\u001B[31m[RECEIVED]\u001B[0m'', result)*/'#13#10 +
    '    if (result?.tag === "message") {'#13#10 +
    '      SetConsoleMessage2("OnReceived_Message_Socket", JSON.stringify(result));'#13#10 +
    '    }'#13#10 +
    '    return result'#13#10 +
    '};';*)


  FrmConsole_JS_SCRIPT_Basic =
    'window.WAPI = {};' + sLineBreak +
    '' + sLineBreak +
    'function localStorageGetItem(item){' + sLineBreak +
    '	let aJson = localStorage.getItem(item);' + sLineBreak +
    '	SetConsoleMessage(''getMyNumber'', aJson.replace(/(?=:)(.*.?)(?=@)/g,''''));' + sLineBreak +
    '};' + sLineBreak +
    '' + sLineBreak +
    'function localStorageGetItemID(item){' + sLineBreak +
    '	let aNumberID = localStorage.getItem(item);' + sLineBreak +
    '	return aNumberID;' + sLineBreak +
    '};' + sLineBreak +
    '' + sLineBreak +
    'function getMyNumber() {' + sLineBreak +
    '	localStorage.getItem(''last-wid-md'') ? ' + sLineBreak +
    '		localStorageGetItem(''last-wid-md'') : ' + sLineBreak +
    '		localStorageGetItem(''last-wid'')' + sLineBreak +
    '' + sLineBreak +
    '	return true;' + sLineBreak +
    '};' + sLineBreak +
    '' + sLineBreak +
    'function getMyNumberID() {' + sLineBreak +
    '	let numberID =' + sLineBreak +
    '		localStorage.getItem(''last-wid-md'') ? ' + sLineBreak +
    '		localStorageGetItemID(''last-wid-md'') : ' + sLineBreak +
    '		localStorageGetItemID(''last-wid'')' + sLineBreak +
    '' + sLineBreak +
    '	return numberID;' + sLineBreak +
    '};' + sLineBreak +
    '' + sLineBreak +
    'function SetConsoleMessage(jsName, resultValue) {' + sLineBreak +
    '    Obj = {' + sLineBreak +
    '        name: jsName,' + sLineBreak +
    '        result: ''{"result":'' + resultValue + ''}''' + sLineBreak +
    '    }' + sLineBreak +
    '    console.log(JSON.stringify(Obj));' + sLineBreak +
    '};' + sLineBreak +
    '' + sLineBreak +
    'window.WAPI.getMe = async function(){' + sLineBreak +
    '  return;' + sLineBreak +
    '}' + sLineBreak +
    '' + sLineBreak +
    'window.WAPI.getWAVersion = function () {' + sLineBreak +
    '    const Version = window.Debug.VERSION;' + sLineBreak +
    '    SetConsoleMessage("getWAVersion", JSON.stringify({WAVersion:Version}));' + sLineBreak +
    '};';



  FrmConsole_JS_StopMonitor              = 'stopMonitor();';
  FrmConsole_JS_StopMonitorNew           = 'stopMonitorNew();'; //Add Marcelo 25/08/2023
  FrmConsole_JS_IsLoggedIn               = 'WAPI.isLoggedIn();';
  FrmConsole_JS_VAR_StartMonitor         = 'startMonitor(intervalSeconds=<#TEMPO#>)';
  FrmConsole_JS_VAR_StartMonitorNew      = 'startMonitorNew(intervalSecondsNew=<#TEMPO#>)'; //Add Marcelo 25/08/2023
  FrmConsole_JS_VAR_StartMonitorWPPCrash = 'startMonitorWPPCrash(intervalSeconds=<#TEMPO#>)';

  FrmConsole_JS_VAR_StartEvento_msg_ack_change = 'startEvento_msg_ack_change(hab_msg_ack_change=<#ACTIVE#>)';
  FrmConsole_JS_VAR_StartEvento_msg_revoke = 'startEvento_msg_revoke(hab_msg_revoke=<#ACTIVE#>)';
  FrmConsole_JS_VAR_StartEvento_new_message = 'startEvento_new_message(hab_new_message=<#ACTIVE#>)';
  FrmConsole_JS_VAR_StartEvento_new_reaction = 'startEvento_new_reaction(hab_new_reaction=<#ACTIVE#>)';

  //Add Marcelo 16/08/2024
  FrmConsole_JS_VAR_StartEvento_active_chat =               'startEvento_active_chat(hab_active_chat=<#ACTIVE#>)';
  FrmConsole_JS_VAR_StartEvento_update_label =              'startEvento_update_label(hab_update_label=<#ACTIVE#>)';
  FrmConsole_JS_VAR_StartEvento_presence_change =           'startEvento_presence_change(hab_presence_change=<#ACTIVE#>)';
  FrmConsole_JS_VAR_StartEvento_group_participant_changed = 'startEvento_group_participant_changed(hab_group_participant_changed=<#ACTIVE#>)';
  FrmConsole_JS_VAR_StartEvento_live_location_start =       'startEvento_live_location_start(hab_live_location_start=<#ACTIVE#>)';
  FrmConsole_JS_VAR_StartEvento_order_payment_status =      'startEvento_order_payment_status(hab_order_payment_status=<#ACTIVE#>)';


  //Marcelo 21/06/2022
  //FrmConsole_JS_VAR_ReadMessages        = 'window.WAPI.sendSeen("<#MSG_PHONE#>")';
  FrmConsole_JS_VAR_ReadMessages        = 'WPP.chat.markIsRead("<#MSG_PHONE#>");';

  FrmConsole_JS_VAR_DeleteMessages      = 'window.WAPI.deleteConversation("<#MSG_PHONE#>")';
  FrmConsole_JS_VAR_SendBase64          = 'window.WAPI.sendImage("<#MSG_BASE64#>","<#MSG_PHONE#>", "<#MSG_NOMEARQUIVO#>", "<#MSG_CORPO#>")';
  FrmConsole_JS_VAR_SendMsg             = 'window.WAPI.sendMessageToID("<#MSG_PHONE#>","<#MSG_CORPO#>")';
  //FrmConsole_JS_VAR_SendContact         = 'window.WAPI.sendVCard("<#MSG_PHONE_DEST#>", "<#MSG_PHONE#>", "<#MSG_NAMECONTACT#>" )';

  FrmConsole_JS_VAR_isBeta              = 'window.WAPI.isBeta();';

  //deprecated
  FrmConsole_JS_VAR_SendTyping          = ''; //deprecated;
  FrmConsole_JS_VAR_SendLocation        = 'window.WAPI.sendLocation("<#MSG_PHONE#>", "<#MSG_LAT#>", "<#MSG_LNG#>", "<#MSG_CORPO#>")';
  FrmConsole_JS_VAR_Logout              = 'localStorage.clear(); location.reload();';
  FrmConsole_JS_VAR_CheckIsValidNumber  = 'window.WAPI.isValidNumber("<#MSG_PHONE#>")'+
                                        '.then(result => SetConsoleMessage("GetCheckIsValidNumber", JSON.stringify(result)))'+
                                        '.catch(error => SetConsoleMessage("GetCheckIsValidNumber", JSON.stringify(error)));';
  FrmConsole_JS_VAR_IsConnected         = 'window.WAPI.isConnected();';

  FrmConsole_JS_VAR_ProfilePicThumb     = 'function convertImgToBase64URL(url, callback, outputFormat){ '+

                                          'var img = new Image();          '+
                                          'img.crossOrigin = "Anonymous";  '+
                                          'img.onload = function(){        '+
                                          '    var canvas = document.createElement("CANVAS"), '+
                                          '    ctx = canvas.getContext("2d"), dataURL;        '+
                                          '    canvas.height = img.height;                    '+
                                          '    canvas.width = img.width;                      '+
                                          '    ctx.drawImage(img, 0, 0);                      '+
                                          '    dataURL = canvas.toDataURL(outputFormat);      '+
                                          '    callback(dataURL);                             '+
                                          '    canvas = null;                                 '+
                                          '};                                                 '+
                                          'img.src = url;                                     '+
                                          '};';


  FrmConsole_JS_VAR_getProfilePicThumb      = 'window.WAPI.teste("<#PROFILE_PICTHUMB_URL#>");';
  //MARCELO 02/05/2022
  FrmConsole_JS_VAR_getProfilePicture       = 'WPP.contact.getProfilePicture("<#PHONE#>");';

  //Add Marcelo 11/02/2023
  FrmConsole_JS_GetAllCommunitys            = 'window.WAPI.getAllCommunitys();';
  FrmConsole_JS_VAR_CreateCommunity         = 'WPP.community.create("<#COMMUNITY_NAME#>", "<#DESCRIPTION#>", <#GROUP_NUMBERS#>);setTimeout(function(){ window.WAPI.getAllCommunitys(); }, 3000);';
  FrmConsole_JS_VAR_addSubgroups            = 'WPP.community.addSubgroups("<#COMMUNITY#>", <#GROUP_NUMBERS#>);setTimeout(function(){ window.WAPI.getAllCommunitys(); }, 3000);';

  FrmConsole_JS_VAR_CreateGroup             = 'WPP.group.create("<#GROUP_NAME#>", "<#PARTICIPANT_NUMBER#>");setTimeout(function(){ window.WAPI.getAllGroups(); }, 3000);';
  FrmConsole_JS_VAR_GroupMsgAdminOnly       = 'WPP.group.setProperty("<#GROUP_ID#>", ''announcement'', true);';
  FrmConsole_JS_VAR_GroupMsgAll             = 'WPP.group.setProperty("<#GROUP_ID#>", ''announcement'', false);';

  FrmConsole_JS_GetAllGroups                = 'window.WAPI.getAllGroups();';//'window.WAPI.listMyGroups();';
  FrmConsole_JS_GetGroupAdmins              = 'window.WAPI.getGroupAdmins("<#GROUP_ID#>");';
  FrmConsole_JS_VAR_listGroupContacts       = 'window.WAPI.getGroupParticipantIDs("<#GROUP_ID#>");';
  FrmConsole_JS_VAR_GetAllParticipantsGroup = 'window.WAPI.getAllParticipantsGroup("<#GROUP_ID#>");';

  FrmConsole_JS_VAR_groupAddParticipant     = 'WPP.group.addParticipants("<#GROUP_ID#>", "<#PARTICIPANT_NUMBER#>");setTimeout(function(){ window.WAPI.getGroupParticipantIDs("<#GROUP_ID#>"); }, 3000);';
  FrmConsole_JS_VAR_groupRemoveParticipant  = 'WPP.group.removeParticipants("<#GROUP_ID#>", "<#PARTICIPANT_NUMBER#>");setTimeout(function(){ window.WAPI.getGroupParticipantIDs("<#GROUP_ID#>"); }, 3000);';
  FrmConsole_JS_VAR_groupPromoteParticipant = 'WPP.group.promoteParticipants("<#GROUP_ID#>", "<#PARTICIPANT_NUMBER#>");setTimeout(function(){ window.WAPI.getGroupAdmins("<#GROUP_ID#>"); }, 3000);';
  FrmConsole_JS_VAR_groupDemoteParticipant  = 'WPP.group.demoteParticipants("<#GROUP_ID#>", "<#PARTICIPANT_NUMBER#>");setTimeout(function(){ window.WAPI.getGroupAdmins("<#GROUP_ID#>"); }, 3000);';
  FrmConsole_JS_VAR_groupLeave              = 'window.WAPI.leaveGroup("<#GROUP_ID#>");';
  FrmConsole_JS_VAR_groupDelete             = 'window.WAPI.deleteConversation("<#GROUP_ID#>");setTimeout(function(){ window.WAPI.getAllGroups(); }, 3000);';
  FrmConsole_JS_VAR_groupJoinViaLink        = 'window.WAPI.joinGroupViaLink("<#GROUP_LINK#>");setTimeout(function(){ window.WAPI.getAllGroups(); }, 3000);';
  FrmConsole_JS_VAR_setProfileName          = 'window.WAPI.setMyName("<#NEW_NAME#>");';
  FrmConsole_JS_VAR_setProfilePicture       = 'WPP.profile.setMyProfilePicture("<#BASE_64#>")';
  FrmConsole_JS_VAR_setMyStatus             = 'window.WAPI.setMyStatus("<#NEW_STATUS#>");';
  FrmConsole_JS_VAR_getStatus               = 'window.WAPI.getStatus("<#PHONE#>");';
  FrmConsole_JS_VAR_ClearChat               = 'WPP.chat.clear("<#PHONE#>");';
  FrmConsole_JS_VAR_ClearChatNew            = 'window.WPP.clearNew("<#PHONE#>");';
  FrmConsole_JS_VAR_getMe                   = 'window.WAPI.getMe();';

  FrmConsole_JS_VAR_genLinkDeviceCodeForPhoneNumber = 'window.WAPI.genLinkDeviceCodeForPhoneNumber2("<#PHONE#>");';

  //FrmConsole_JS_VAR_getGroupInviteLink    = 'window.WAPI.getGroupInviteLink("<#GROUP_ID#>");'; deprecated
  FrmConsole_JS_VAR_getGroupInviteLink      = 'window.WAPI.getInviteCode2("<#GROUP_ID#>");';

  FrmConsole_JS_VAR_sendGroupInviteMessageNew  = 'window.WPP.sendGroupInviteMessageNew("<#CHAT_ID#>","<#GROUP_ID#>","<#INVITE_CODE#>","<#SEUID#>");';

  //WPP.group.reject(12345645@g.us, 5554999999999@c.us);
  FrmConsole_JS_VAR_GroupMembershipReject   = 'WPP.group.reject("<#GROUP_ID#>","<#CHAT_ID#>");';
  FrmConsole_JS_VAR_GroupMembershipApprove  = 'WPP.group.approve("<#GROUP_ID#>","<#CHAT_ID#>");';

  //FrmConsole_JS_VAR_removeGroupInviteLink   = 'window.WAPI.revokeGroupInviteLink("<#GROUP_ID#>");'; deprecated
  FrmConsole_JS_VAR_removeGroupInviteLink   = 'WPP.group.revokeInviteCode("<#GROUP_ID#>");';

  FrmConsole_JS_VAR_SetGroupDescription     = 'WPP.group.setDescription("<#GROUP_ID#>","<#Description#>");';

  FrmConsole_JS_VAR_SetGroupPicture         = 'WPP.group.setIcon("<#GROUP_ID#>","<#BASE_64#>");';


  FrmConsole_JS_VAR_SaveContact             = 'WPP.contact.save("<#PHONE#>", "<#NAME_CONTACT#>", { surname: "<#SURNAME_CONTACT#>", syncAdressBook: true,});';


  FrmConsole_JS_VAR_checkNumberStatus       = 'window.WAPI.checkNumberStatus("<#PHONE#>");';
  //Adicionado Por Marcelo 01/03/2022 deprecated
  FrmConsole_JS_VAR_SendListMenu        = 'window.WAPI.sendListMenu("<#MSG_PHONE#>","<#MSG_TITLE#>","<#MSG_SUBTITLE#>","<#MSG_DESCRIPTION#>","<#MSG_BUTTONTEXT#>",<#MSG_MENU#>);';


  //WPPConnect

  //MARCELO 13/06/2022
  FrmConsole_JS_VAR_setKeepAlive        = 'WPP.conn.setKeepAlive(<#ATIVO#>);';

  //MARCELO 03/05/2022
  FrmConsole_JS_VAR_markIsComposing     = 'WPP.chat.markIsComposing("<#MSG_PHONE#>", <#MSG_DURATION#>);';
  FrmConsole_JS_VAR_markIsRead          = 'WPP.chat.markIsRead("<#MSG_PHONE#>");';
  FrmConsole_JS_VAR_markIsRecording     = 'WPP.chat.markIsRecording("<#MSG_PHONE#>", <#MSG_DURATION#>);';
  FrmConsole_JS_VAR_markIsUnread        = 'WPP.chat.markIsUnread("<#MSG_PHONE#>");';

  //Marcelo 07/04/2024
  FrmConsole_JS_VAR_markIsComposingNew  = 'window.WPP.markIsComposingNew("<#MSG_PHONE#>", <#MSG_DURATION#>, "<SEUID>");';
  FrmConsole_JS_VAR_markIsReadNew       = 'window.WPP.markIsReadNew("<#MSG_PHONE#>", "<SEUID>");';
  FrmConsole_JS_VAR_markIsRecordingNew  = 'window.WPP.markIsRecordingNew("<#MSG_PHONE#>", <#MSG_DURATION#>, "<SEUID>");';
  FrmConsole_JS_VAR_markIsUnreadNew     = 'window.WPP.markIsUnreadNew("<#MSG_PHONE#>", "<SEUID>");';
  FrmConsole_JS_VAR_markPlayedNew     = 'window.WPP.markPlayedNew("<#MSG_PHONE#>", "<SEUID>");';

  //Adicionado Por Marcelo 14/03/2023
  FrmConsole_JS_VAR_markPlayed          = 'WPP.chat.markPlayed("<#MSG_PHONE#>");';

  //FrmConsole_JS_VAR_getMessageById      = 'WPP.chat.getMessageById(["<#MSGKEY#>"]);';
  FrmConsole_JS_VAR_getMessageById      = 'window.WAPI.getMessageById2("<#MSGKEY#>");';

  //Adicionado Por Marcelo 14/03/2023
  FrmConsole_JS_VAR_getMessageACK       = 'window.WAPI.getMessageACK2("<#MSGKEY#>");';

  //Marcelo 24/10/2022
  FrmConsole_JS_VAR_deleteMessageById   = 'WPP.chat.deleteMessage("<#MSG_PHONE#>","<#MSG_UNIQUE_ID#>",true,true);';

  FrmConsole_JS_VAR_deleteMessageNew   = 'window.WPP.deleteMessageNew("<#MSG_PHONE#>","<#MSG_UNIQUE_ID#>",true,true, "<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>" );';

  FrmConsole_JS_VAR_getMessage          = 'window.WAPI.getMessages("<#MSG_PHONE#>",{<#MSG_OPTIONS#>} ); ';

  FrmConsole_JS_VAR_getPlatformFromMessage = 'window.WAPI.getPlatformFromMessage2("<#MSG_UNIQUE_ID#>","<#MSG_PHONE#>");';

  FrmConsole_JS_VAR_SendReactionMessage = 'WPP.chat.sendReactionToMessage("<#MSG_UNIQUE_ID#>", <#MSG_REACTION#>);';


  FrmConsole_JS_VAR_SendScheduledCallMessage = 'WPP.chat.sendScheduledCallMessage("<#MSG_PHONE#>", {<#MSG_OPTIONS#>}); ';

  //Adicionado Por Marcelo 26/04/2022
  //FrmConsole_JS_VAR_SendButtons        = 'window.WAPI.sendButtons("<#MSG_PHONE#>","<#MSG_TITLE#>",<#MSG_BUTTONS#>,"<#MSG_FOOTER#>")';
                                        //Alterado Por Marcelo 31/05/2022
  FrmConsole_JS_VAR_SendButtons         = 'window.WAPI.sendTextMessage2("<#MSG_PHONE#>","<#MSG_TITLE#>",{<#MSG_BUTTONS#>});';

  //Alterado Por Marcelo 10/05/2022     //Alterado Por Marcelo 31/05/2022
  FrmConsole_JS_VAR_SendTextMessage     = 'window.WAPI.sendTextMessage2("<#MSG_PHONE#>","<#MSG_CONTENT#>",{<#MSG_OPTIONS#>});';

  //Adicionado Por Marcelo 30/04/2022     //Alterado Por Marcelo 31/05/2022
  FrmConsole_JS_VAR_sendFileMessage     = 'window.WAPI.sendFileMessage2("<#MSG_PHONE#>","<#MSG_CONTENT#>",{<#MSG_OPTIONS#>} );';
  FrmConsole_JS_VAR_sendListMessage     = 'window.WAPI.sendListMessage2("<#MSG_PHONE#>",{<#MSG_MENU#>} );';


  FrmConsole_JS_VAR_sendLocationMessage = 'WPP.chat.sendLocationMessage("<#MSG_PHONE#>",{<#MSG_OPTIONS#>} );';

  //Adicionado Por Marcelo 09/05/2022     //Alterado Por Marcelo 31/05/2022
  FrmConsole_JS_VAR_SendLinkPreview     = 'window.WAPI.sendTextMessage2("<#MSG_PHONE#>","<#MSG_LINK#>", {<#MSG_CORPO#>} );';
  //FrmConsole_JS_VAR_SendLinkPreview     = 'window.WAPI.sendLinkWithAutoPreview("<#MSG_PHONE#>", "<#MSG_LINK#>", "<#MSG_CORPO#>")';

  //MARCELO 02/05/2022
  FrmConsole_JS_VAR_SendContact         = 'WPP.chat.sendVCardContactMessage("<#MSG_PHONE_DEST#>","<#MSG_PHONE#>", {} )';


  //MARCELO 17/01/2023
  FrmConsole_JS_VAR_getHistorySyncProgress  = 'window.WAPI.getHistorySyncProgress2();';

  //DANIEL 25/05/2022
  FrmConsole_JS_VAR_BlockContact        = 'WPP.blocklist.blockContact("<#CTT_NAME#>");';
  FrmConsole_JS_VAR_unBlockContact      = 'WPP.blocklist.unblockContact("<#CTT_NAME#>");';
  FrmConsole_JS_VAR_ArchiveChat         = 'WPP.chat.archive("<#CTT_NAME#>");';
  FrmConsole_JS_VAR_UnarchiveChat       = 'WPP.chat.unarchive("<#CTT_NAME#>");';

  //Marcelo 07/04/2024
  FrmConsole_JS_VAR_BlockContactNew     = 'window.WPP.blockContactNew("<#CTT_NAME#>", "<#SEUID#>");';
  FrmConsole_JS_VAR_unBlockContactNew   = 'window.WPP.unblockContactNew("<#CTT_NAME#>", "<#SEUID#>");';
  FrmConsole_JS_VAR_ArchiveChatNew      = 'window.WPP.archiveNew("<#CTT_NAME#>", "<#SEUID#>");';
  FrmConsole_JS_VAR_UnarchiveChatNew    = 'window.WPP.unarchiveNew("<#CTT_NAME#>", "<#SEUID#>");';
  FrmConsole_JS_VAR_PinChatNew          = 'window.WPP.pin("<#CTT_NAME#>", "<#SEUID#>");';
  FrmConsole_JS_VAR_UnPinChatNew        = 'window.WPP.unpin("<#CTT_NAME#>", "<#SEUID#>");';


  FrmConsole_JS_VAR_ArchiveAllChats     = 'archiveAllChats()';
  FrmConsole_JS_VAR_DeleteAllChats      = 'deleteAllChats()';
  FrmConsole_JS_VAR_DeleteAllChatsUsers = 'deleteAllChatsUsers()';
  FrmConsole_JS_VAR_PinChat             = 'WPP.chat.pin("<#CTT_NAME#>");';
  FrmConsole_JS_VAR_UnPinChat           = 'WPP.chat.unpin("<#CTT_NAME#>");';

  //MARCELO 21/10/2023
  FrmConsole_JS_VAR_DeleteOldChats      = 'deleteOldChats(<#QtdChatsExcluir#>);';

  //MARCELO 22/10/2023
  FrmConsole_JS_VAR_MarkIsReadChats     = 'markIsReadChats(<#NumberChatsIsRead#>);';

  //MARCELO 23/10/2023
  FrmConsole_JS_VAR_MarkIsUnreadChats   = 'markIsUnreadChats(<#NumberChatsUnread#>);';

  FrmConsole_JS_VAR_CreatePoolMessage   = 'WPP.chat.sendCreatePollMessage("<#GROUP_ID#>","<#MSG_CONTENT#>",<#CHOICES#>, {<#OPTIONS#>} ); ';
  FrmConsole_JS_VAR_CreatePoolMessageEx = 'window.WAPI.sendCreatePollMessage2Ex("<#GROUP_ID#>","<#MSG_CONTENT#>",<#CHOICES#>, {<#OPTIONS#>}, "<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>" ); ';
  FrmConsole_JS_VAR_CreatePoolMessageNew = 'window.WPP.sendCreatePollMessageNew("<#GROUP_ID#>","<#MSG_CONTENT#>",<#CHOICES#>, {<#OPTIONS#>}, "<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>" ); ';

  //Marcelo 07/07/2023
  FrmConsole_JS_VAR_GetVotes           = 'window.WAPI.getVotes("<#MSG_UNIQUE_ID#>");';

  //Marcelo 14/09/2022
  FrmConsole_JS_VAR_DeleteChat          = 'WPP.chat.delete("<#MSG_PHONE#>");';


  FrmConsole_JS_VAR_RecreateChatFix =
  '(async () => {' + sLineBreak +
  '  let chatId = WPP.util.createWid("<#MSG_PHONE#>");' + sLineBreak +
  '  let chatParams = { chatId };' + sLineBreak +
  '' + sLineBreak +
  '  await WPP.whatsapp.functions.createChat(' + sLineBreak +
  '    chatParams,' + sLineBreak +
  '    ''chatListUtils'',' + sLineBreak +
  '    {' + sLineBreak +
  '      createdLocally: true,' + sLineBreak +
  '      lidOriginType: ''general'',' + sLineBreak +
  '    }' + sLineBreak +
  '  );' + sLineBreak +
  '  await WPP.whatsapp.functions.getExisting(chatId);' + sLineBreak +
  '})();';
 //Add Marcelo 19/05/2025

  //Marcelo 18/05/2022
  FrmConsole_JS_VAR_sendRawMessage      = 'WPP.chat.sendRawMessage("<#MSG_PHONE#>","<#MSG_RAW#>",{<#MSG_OPTIONS#>} );';

  //Marcelo 06/04/2024
  FrmConsole_JS_VAR_SendTextMessageNew   = 'window.WPP.SendTextMessageNew("<#MSG_PHONE#>","<#MSG_CONTENT#>",{<#MSG_OPTIONS#>},"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>");';
  FrmConsole_JS_VAR_SendFileMessageNew   = 'window.WPP.SendFileMessageNew("<#MSG_PHONE#>","<#MSG_CONTENT#>",{<#MSG_OPTIONS#>},"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>");';
  FrmConsole_JS_VAR_SendListMessageNew   = 'window.WPP.SendListMessageNew("<#MSG_PHONE#>",{<#MSG_MENU#>},"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>");';
  FrmConsole_JS_VAR_SendVCardContactMessageNew  = 'window.WPP.sendVCardContactMessageNew("<#MSG_PHONE_DEST#>","<#MSG_PHONE#>", {} ,"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>");';
  FrmConsole_JS_VAR_SendLocationMessageNew   = 'window.WPP.SendLocationMessageNew("<#MSG_PHONE#>",{<#MSG_OPTIONS#>},"<#MSG_SEUID#>","<#MSG_SEUID2#>","<#MSG_SEUID3#>","<#MSG_SEUID4#>");';

  //TEMIS 03-06-2022 Obtendo Retorno do Envio com SeuID
  FrmConsole_JS_VAR_SendTextMessageEx   = 'window.WAPI.sendTextMessage2Ex("<#MSG_PHONE#>","<#MSG_CONTENT#>",{<#MSG_OPTIONS#>},"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>");';
  FrmConsole_JS_VAR_sendFileMessageEx   = 'window.WAPI.sendFileMessage2Ex("<#MSG_PHONE#>","<#MSG_CONTENT#>",{<#MSG_OPTIONS#>},"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>");';
  FrmConsole_JS_VAR_sendListMessageEx   = 'window.WAPI.sendListMessage2Ex("<#MSG_PHONE#>",{<#MSG_MENU#>},"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>");';

  //MARCELO 16/01/2023
  FrmConsole_JS_VAR_sendVCardContactMessageEx  = 'window.WAPI.sendVCardContactMessage2Ex("<#MSG_PHONE_DEST#>","<#MSG_PHONE#>", {} ,"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>");';


  //Marcelo 17/09/2022
  FrmConsole_JS_VAR_sendLocationMessageEx   = 'window.WAPI.sendLocationMessage2Ex("<#MSG_PHONE#>",{<#MSG_OPTIONS#>},"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>" );';

  //Marcelo 25/06/2024
  FrmConsole_JS_VAR_sendPixKeyMessageNew   = 'window.WPP.sendPixKeyMessageNew("<#MSG_PHONE#>",{<#MSG_OPTIONS#>},"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>" );';

  //Marcelo 29/06/2024
  FrmConsole_JS_VAR_sendOrderMessageNew    = 'window.WPP.sendOrderMessageNew("<#MSG_PHONE#>",[{<#MSG_ITEMS#>}], {<#MSG_OPTIONS#>},"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>" );';
  FrmConsole_JS_VAR_sendChargeMessageNew   = 'window.WPP.sendChargeMessageNew("<#MSG_PHONE#>",[{<#MSG_ITEMS#>}], {<#MSG_OPTIONS#>},"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>" );';

  FrmConsole_JS_VAR_editMessage         = 'WPP.chat.editMessage("<#MSG_UNIQUE_ID#>","<#MSG_NEW_MESSAGE#>",{<#MSG_OPTIONS#>} );';

  FrmConsole_JS_VAR_editMessageNew      = 'window.WPP.editMessageNew("<#MSG_UNIQUE_ID#>","<#MSG_NEW_MESSAGE#>",{<#MSG_OPTIONS#>},"<#MSG_SEUID#>", "<#MSG_SEUID2#>", "<#MSG_SEUID3#>", "<#MSG_SEUID4#>"  );';

  FrmConsole_JS_VAR_forwardMessage      =  'WPP.chat.forwardMessage("<#MSG_PHONE#>","<#MSG_UNIQUE_ID#>" );';

  //Marcelo 25/10/2022
  FrmConsole_JS_VAR_getList   = 'window.WAPI.list();';


  //Marcelo 18/07/2022
  FrmConsole_JS_VAR_CheckNumberExists   = 'window.WAPI.CheckNumberExists("<#MSG_PHONE#>");';

  //Daniel - 26/06/2022
  FrmConsole_JS_VAR_GetProductCatalog   = 'window.WAPI.ProductCatalog();';

  //Marcelo 14/06/2022
  FrmConsole_JS_VAR_sendTextStatus   = 'WPP.status.sendTextStatus("<#MSG_CONTENT#>",{<#MSG_OPTIONS#>} );';

  //Marcelo 28/06/2022
  FrmConsole_JS_VAR_sendImageStatus  = 'WPP.status.sendImageStatus("<#MSG_CONTENT#>",{<#MSG_OPTIONS#>} );';
  FrmConsole_JS_VAR_sendVideoStatus  = 'WPP.status.sendVideoStatus("<#MSG_CONTENT#>",{<#MSG_OPTIONS#>} );';
  FrmConsole_JS_VAR_sendRawStatus    = 'WPP.status.sendRawStatus("<#MSG_CONTENT#>",{<#MSG_OPTIONS#>} );';
  FrmConsole_JS_VAR_getMyStatus      = 'getMyStatus();';

  FrmConsole_JS_VAR_newsletter_create  = 'WPP.newsletter.create("<#NAME#>",{<#OPTIONS#>} );';

  //Marcelo 15/06/2022
  FrmConsole_JS_VAR_rejectCall       = 'WPP.call.rejectCall("<#MSG_ID#>");';

  //MARCELO 02/04/2023
  FrmConsole_JS_VAR_SendCall         = 'WPP.call.offer("<#MSG_ID#>", {<#MSG_OPTIONS#>} ); ';
  FrmConsole_JS_VAR_EndCall          = 'WPP.call.end("<#MSG_ID#>"); ';
  FrmConsole_JS_VAR_EndCallALL       = 'WPP.call.end(); ';
  FrmConsole_JS_VAR_AcceptCall       = 'WPP.call.accept("<#MSG_ID#>"); ';
  FrmConsole_JS_VAR_AcceptCallALL    = 'WPP.call.accept(); ';


  //Marcelo 31/07/2022
  FrmConsole_JS_VAR_getLastSeen       = 'window.WAPI.getLastSeen("<#MSG_PHONE#>");';

  //Marcelo 03/05/2023
  FrmConsole_JS_VAR_GetIsOnline       = 'window.WAPI.GetisOnline2();';

resourcestring
  MSG_ConfigCEF_ExceptNotFoundJS       = '';
  MSG_ConfigCEF_ExceptNotFoundPATH     = '';
  MSG_ConfigCEF_ExceptConnection       = '';
  MSG_ConfigCEF_ExceptBrowse           = '';
  MSG_ConfigCEF_ExceptConnetServ       = '';
  MSG_ConfigCEF_ExceptConsoleNaoPronto = '';
  MSG_ConfigCEF_ExceptVersaoErrada     = '';
  MSG_ConfigCEF_ExceptVersaoErrada_L2  = '';
  MSG_ExceptSetBatteryLow              = '';
  MSG_ExceptOnAlterQrCodeStyle         = '';
  MSG_ExceptConfigVersaoCompInvalida   = '';
  MSG_ExceptUpdate                     = '';
  MSG_WarningDuplicityDetected         = '';
  MSG_ExceptJS_ABRUnknown              = '';
  MSG_ExceptNotAssignedOnGetQrCode     = '';
  Text_FrmClose_Caption                = '';
  Text_FrmClose_Label                  = '';
  Text_FrmClose_WarningClose           = 'Fechar a aplicação?';
  Text_FrmQRCode_CaptionStart          = '';
  Text_FrmQRCode_CaptionSucess         = '';
  Text_FrmQRCode_OnCLose               = '';
  MSG_ExceptPhoneNumberError           = '';
  MSG_ExceptAlterDesigner              = '';
  MSG_ExceptCOntactNotFound            = '';
  MSG_ExceptCOntactSaveFile            = '';
  MSG_ExceptAlterInicialized           = '';
  MSG_ExceptErrorLocateForm            = '';
  MSG_ExceptPath                       = '';
  MSG_ExceptGlobalCef                  = '';
  MSG_WarningClosing                   = '';
  MSG_ExceptMisc                       = '';
  Text_FrmConsole_Caption              = 'WPP Connect';
  Text_FrmConsole_LblMsg               = '';
  MSG_WarningClassUnknown              = '';
  MSG_Exceptlibeay32dll                = 'Erro HTTP GET (js.abr) Atualize as dlls "libeay32.dll" e "ssleay32.dll"';
  Text_Vcard_Comments1                 = '';
  Text_Vcard_Comments2                 = '';
  Text_Vcard_Comments3                 = '';
  MSG_WarningQrCodeStart1              = '';
  Text_Status_Serv_Initialized         = '';
  Text_Status_Serv_Initializing        = '';
  Text_Status_Serv_Disconnected        = '';
  Text_Status_Serv_Disconnecting       = '';
  Text_Status_Serv_Connected           = '';
  Text_Status_Serv_ConnectedDown       = '';
  Text_Status_Serv_Connecting          = '';
  Text_Status_Serv_ConnectingNoPhone   = '';
  Text_Status_Serv_ConnectingReaderQR  = '';
  Text_Status_Serv_TimeOut             = '';
  Text_Status_Serv_Destroying          = '';
  Text_Status_Serv_Destroy             = '';
  Text_Status_Serv_Rebooting           = '';
  Text_Status_Serv_IsReady             = '';
  Text_Status_Serv_IsWhatsAppWebReady  = '';
  MSG_WarningNothingtoSend             = '';
  MSG_WarningErrorFile                 = '';
  MSG_Except_Data_TypeObj              = '';
  MSG_Except_DATA_ConnectRepass        = '';
  MSG_Except_DATA_ConnectionNull       = '';
  MSG_Except_AtribuicaoInvalida        = '';
  MSG_WarningDeveloper                 = '';
  Text_DefaultPathDown                 = '';
  Text_DefaultError                    = '';
  MSG_Except_SaveAttached              = '';
  MSG_Except_CefNull                   = '';
  Text_System_memUse                   = '';
  Text_System_memTot                   = '';
  Text_System_memFree                  = '';
  Text_System_memLoad                  = '';

  Text_FrmConfigNetWork_Caption        = '';
  Text_FrmConfigNetWork_ProxyTypeLbl   = '';
  Text_FrmConfigNetWork_ProxyServerLbl = '';
  Text_FrmConfigNetWork_ProxyPortLbl   = '';
  Text_FrmConfigNetWork_ProxyUsernameLbl            = '';
  Text_FrmConfigNetWork_ProxyPasswordLbl            = '';
  Text_FrmConfigNetWork_ProxyScriptURLLbl           = '';
  Text_FrmConfigNetWork_ProxyByPassListLbl          = '';
  Text_FrmConfigNetWork_MaxConnectionsPerProxyLbl   = '';
  Text_FrmConfigNetWork_GroupBox2        = '';
  Text_FrmConfigNetWork_HeaderNameLbl    = '';
  Text_FrmConfigNetWork_HeaderValueLbl   = '';
  Text_FrmConfigNetWork_BntOK            = '';
  Text_FrmConfigNetWork_BntCancel        = '';
  Text_FrmConfigNetWork_QuestionSave     = '';
  Text_FrmConfigNetWork_PrtocolLbl       = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';
//  Text_FrmQRCode_OnCLose                 = '';

type

    TLanguageInject       = (TL_Portugues_BR=0, TL_English=1, TL_Espanol=2, TL_Farsi=3, TL_Italian=4, TL_German=5, TL_French=6,
      TL_Russian=7, TL_Afrikaans=8, TL_Hindi=9, TL_Indonesian=10, TL_Turkish=11, TL_Urdu=12, TL_Bengali=13 );

    TConnectionDBType     = (TCon_None=0, TCon_Memory=1,  TCon_FireDAC=2, TCon_DBExpress=3, TCon_ADO=4);

    TFormQrCodeType       = (Ft_Desktop=0,       Ft_Http=1,    Ft_None=2);  //Form ou RestDataWare
    TSendFile_Image       = (Tsf_Jpg=0, Tsf_Jpeg=1, Tsf_Tif=2, Tsf_Ico=3, Tsf_Bmp=4, Tsf_Png=5, Tsf_Raw=6, Tsf_webP=7, Tsf_SVG=8);

    TDownloadJSType       = (DT_Indy=0, DT_Rest=1);

    TStatusType           = (Inject_Initialized,            Inject_Initializing,       Inject_Destroying,      Inject_Destroy,
                             Server_Disconnected,           Server_Disconnecting,
                             Server_Connected,              Server_ConnectedDown,
                             Server_Connecting,             Server_ConnectingNoPhone,
                             Server_ConnectingReaderCode,   Server_TimeOut,
                             Server_Rebooting
                             ,Inject_IsReady
                             ,Inject_IsWhatsAppWebReady
                            );

    TTypeHeader = (Th_None = 0,
                   //Eventos de Retornos
                   Th_GetAllContacts=1,         Th_GetAllChats=2,                      Th_GetUnreadMessages=3,    Th_GetAllGroupContacts=4,
                   Th_GetBatteryLevel=5,        Th_GetQrCodeForm=6,                    Th_GetQrCodeWEB=7,
                   Th_GetMyNumber=8,            Th_OnChangeConnect=9,                  Th_getIsDelivered=10,
                   Th_GetReserv2=11,            Th_GetReserv3=12,                      Th_GetReserv4=13,
                   Th_GetReserv5=14,            Th_GetReserv6=15,                      Th_GetReserv7=16,
                   Th_GetCheckIsValidNumber=17, Th_GetCheckIsConnected=18,             Th_GetProfilePicThumb=19,  Th_getAllGroups=20, Th_getAllGroupAdmins=21,

                   //Eventos Conexao
                   Th_Disconnected=22,          Th_Disconnecting=23,                   Th_Connected=24,
                   Th_ConnectedDown=25,         Th_Connecting=26,                      Th_ConnectingFt_Desktop=27,
                   Th_ConnectingFt_HTTP=28,     Th_ConnectingNoPhone=29,               Th_Destroy=30,
                   Th_Destroying=31,            Th_NewSyncContact=32,                  Th_Initializing=33,
                   Th_Initialized=34,           Th_Abort=35,                           Th_ForceDisconnect=36,
                   Th_AlterConfig=37,

                   // Novos Eventos de Retorno by Marcelo
                   Th_GetStatusMessage=38, Th_GetGroupInviteLink=39, Th_GetMe=40, Th_NewCheckIsValidNumber=41
                   , Th_GetCheckIsBeta=42, Th_getMessageById=43 //Marcelo 06/05/2022
                   , Th_SendFileMessage=44, Th_SendTextMessage=45, Th_SendListMessage=46 //Marcelo 31/05/2022
                   , Th_SendTextMessageEx=47, Th_SendFileMessageEx=48, Th_SendListMessageEx=49   //Temis 03-06-2022
                   , Th_IncomingiCall=50    //Marcelo 16-06-2022
                   , Th_ProductCatalog=51   //Daniel 26/06/2022
                   , Th_WPPCrashMonitor=52  //Daniel 18/07/2022
                   , Th_CheckNumberExists=53 //Marcelo 18/07/2022
                   , Th_getLastSeen=54 //Marcelo 31/07/2022
                   , Th_getMessages=55 //Marcelo 14/08/2022
                   , Th_SendLocationMessageEx=56 //Marcelo 17/09/2022
                   , Th_IsReady=57 //Marcelo 17/09/2022
                   , Th_IsLoaded=58 //Marcelo 17/09/2022
                   , Th_IsAuthenticated=59 //Marcelo 18/09/2022
                   , Th_getPlatformFromMessage=60 //Marcelo 20/09/2022
                   , Th_getList=61 //Marcelo 25/10/2022
                   , Th_sendVCardContactMessageEx=62 //Marcelo 16/01/2023
                   , Th_getHistorySyncProgress=63 //Marcelo 17/01/2023
                   , Th_QrCodeDesconectouErroCache=64 //Marcelo 06/02/2023
                   , Th_getAllcommunitys=65 //Marcelo 11/02/2023
                   , Th_getMessageACK=66 //Marcelo 14/03/2023
                   , Th_getIsOnline=67 //Marcelo 03/05/2023
                   , Th_getEnvIsOnline=68 //Marcelo 03/05/2023
                   , Th_GetMyContacts=69 //Marcelo 01/07/2023
                   , Th_GetVotes=70 //Marcelo 07/07/2023
                   , Th_Getpoll_response=71 //Marcelo 07/07/2023
                   , Th_sendCreatePollMessageEx=72 //Marcelo 25/07/2023
                   , Th_Getnew_message=73 //Marcelo 25/07/2023
                   , Th_Getnew_reaction=74 //Marcelo 25/07/2023
                   , Th_Getmsg_ack_change=75 //Marcelo 26/07/2023
                   , Th_Getmsg_revoke=76 //Marcelo 26/07/2023
                   , Th_GetTotalChatsUserRead=77 //Marcelo 22/10/2023
                   , Th_GetWAVersion=78 //Marcelo 22/10/2023
                   , Th_GetgenLinkDeviceCodeForPhoneNumber=79 //Marcelo 30/10/2023
                   , Th_Getmsg_edited=80 //Marcelo 29/01/2024
                   , Th_ErrorResponse=81 //Marcelo 14/03/2024
                   , Th_deleteMessageNew=82 //Marcelo 26/04/2024
                   , Th_IsLogout=83 //Marcelo 04/05/2024
                   , Th_editMessageNew=84 //Marcelo 23/05/2024
                   , Th_outgoingCall=85 //Marcelo 17/06/2024
                   , Th_GetEnvneedsUpdate=86 //Marcelo 03/07/2024
                   , Th_logout_reason=87 //Marcelo 11/07/2024
                   , Th_Getactive_chat=88 //Marcelo 13/08/2024
                   , Th_Getpresence_change=89 //Marcelo 13/08/2024
                   , Th_Getupdate_label=90 //Marcelo 13/08/2024
                   , Th_Getgroup_participant_changed=91 //Marcelo 13/08/2024
                   , Th_Getorder_payment_status=92 //Marcelo 13/08/2024
                   , Th_Getlive_location_start=93 //Marcelo 13/08/2024
                   , Th_GetEnvrequire_auth=94 //Marcelo 21/08/2024
                   , Th_GetAllParticipantsGroup=95 //Marcelo 01/09/2024
                   , Th_isWhatsAppWebReady=96 //Marcelo 24/04/2025
                   , Th_OnReceived_Message_Socket=97 //Marcelo 09/05/2025
                   , Th_OnReceived_Message_Socket2=98 //Marcelo 19/05/2025
                   );

    Function   VerificaCompatibilidadeVersao(PVersaoExterna:String; PversaoInterna:String):Boolean;
    Function   FrmConsole_JS_AlterVar(var PScript:String;  PNomeVar: String;  Const PValor:String):String;
    function   StrToTypeHeader(PText: string): TTypeHeader;
    Procedure  SleepNoFreeze(PTimeOut:Integer);
    Function   StrExtFile_Base64Type(PFileName: String): String;
    procedure  save_log(line: string);

implementation

uses
  System.JSON, System.Classes, Vcl.Dialogs, Vcl.Forms, Winapi.Windows, uTWPPConnect.ConfigCEF;


Function VerificaCompatibilidadeVersao(PVersaoExterna:String; PversaoInterna:String):Boolean;
Var
  LVersionInt : TStringList;
  LVersionExt : TStringList;
  LInt, LExt: String;
  I: Integer;
Begin
  LVersionInt := TStringList.Create;
  LVersionExt := TStringList.Create;
  try
    PVersaoExterna   := StringReplace(PVersaoExterna, ',', '.',    [rfReplaceAll, rfIgnoreCase]);
    PversaoInterna   := StringReplace(PversaoInterna, ',', '.',    [rfReplaceAll, rfIgnoreCase]);

    ExtractStrings(['.'],[], PWideChar(PversaoInterna), LVersionInt);
    ExtractStrings(['.'],[], PWideChar(PVersaoExterna), LVersionExt);
    for I := 0 to LVersionInt.count -1 do
      LInt := LInt + Copy(LVersionInt.Strings[i] + '00000000', 0, Versao0porCasas);

    for I := 0 to LVersionExt.count -1 do
      LExt := LExt + Copy(LVersionExt.Strings[i] + '00000000', 0, Versao0porCasas);

  finally
    Result := Not (StrToInt64def(LExt, 0) > StrToInt64def(LInt, 0));
    FreeAndNil(LVersionInt);
    FreeAndNil(LVersionExt);
  end;
End;


Function FrmConsole_JS_AlterVar(var PScript:String;  PNomeVar: String;  Const PValor:String):String;
Begin
  //Ele pode trazer montado em PSCRIPT ou no retorno
  If PNomeVar = '' Then Exit;
  if pos('<', PNomeVar) = 0 Then
     PNomeVar := '<'+PNomeVar;
  if pos('>', PNomeVar) = 0 Then
     PNomeVar := PNomeVar + '>';
  PScript := StringReplace(PScript, PNomeVar, PValor, [rfReplaceAll, rfIgnoreCase]);
  result  := PScript;
end;


Procedure SleepNoFreeze(PtimeOut:Integer);
var
  LIni: Cardinal;
  Lpass : Integer;
Begin
  LIni := GetTickCount;
  Lpass:= 0;
  Application.ProcessMessages;
  Repeat
    inc(Lpass);
    Sleep(1);
    if (Lpass > 10) then
    Begin
      Lpass:= 0;
      Application.ProcessMessages;
    end;
  Until (GetTickCount - LIni) >= Cardinal(PtimeOut) ;
End;


Function  StrExtFile_Base64Type(PFileName: String): String;
var
  I: Integer;
  LExt: String;
  Ltmp: String;
Begin
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
    for I := 0 to 8 do
    begin
      Ltmp := LowerCase(Copy(GetEnumName(TypeInfo(TSendFile_Image), ord(TSendFile_Image(i))), 3, 50));
      if pos(LExt, Ltmp) > 0 Then
      Begin
        Result := 'data:image/';
        Exit;
      end
    end;
  finally
     Result := Result + LExt + ';base64,' ;
  end;
End;

function  StrToTypeHeader(PText: string): TTypeHeader;
const LmaxCount = 98; //Marcelo 19/05/2025
var
  I: Integer;
  LNome: String;
Begin
  PText   := LowerCase(Trim(Ptext));
  Result  := Th_None;
  if Trim(PText) = '' then
     Exit;
  for I := 0 to LmaxCount do
  Begin
    LNome   := LowerCase(GetEnumName(TypeInfo(TTypeHeader), ord(TTypeHeader(i))));
    LNome   := Copy(LNome, 4, 50); //tira o TH_
    if PText = LNome then
    Begin
      Result := TTypeHeader(i);
      break;
    End;
  End;

  if Result  = Th_None Then
  Begin
    //Acha por semelhança
    for I := 0 to LmaxCount do
    Begin
      LNome   := LowerCase(GetEnumName(TypeInfo(TTypeHeader), ord(TTypeHeader(i))));
      if POs(LowerCase(PText), LNome) > 0 then
      Begin
        Result := TTypeHeader(i);
        break;
      End;
    End;
  End;
End;


procedure save_log(line: string);
var
  nomearq: string;
  arq: TextFile;
begin
  try
    if Assigned(GlobalCEFApp) then
    begin
      if (not GlobalCEFApp.LogConsoleActive) or (GlobalCEFApp.LogConsole = '') Then
        Exit;

      if not(DirectoryExists(ExtractFilePath(ParamStr(0)) + 'LogTWppConnect')) then
        CreateDir(ExtractFilePath(ParamStr(0)) + 'LogTWppConnect');

      nomearq := ExtractFilePath(ParamStr(0)) + 'LogTWppConnect' + '\LogInit' +
        FormatDateTime('YYYY-MM-DD', now) + '.log';

      AssignFile(arq, nomearq);
      try
        if FileExists(nomearq) then
          Append(arq)
        else
          Rewrite(arq);

        Writeln(arq, FormatDateTime('DD/MM/YYYY', Date) + ' ' +
          FormatDateTime('HH:MM:SS:ZZ', time) + ' ' + line);
        Flush(arq);
      finally
        CloseFile(arq);
      end;
    end;

  except
  end;
end;


end.


