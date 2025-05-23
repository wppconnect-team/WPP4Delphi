{####################################################################################################################
                              WPPCONNECT - Componente de comunica��o (N�o Oficial)
                                           https://wppconnect-team.github.io/
                                            Maio de 2022
####################################################################################################################
    Owner.....: Marcelo           - marcelo.broz@hotmail.com   -
    Developer.: Marcelo           - marcelo.broz@hotmail.com   - +55 17 9.8138-8414
            
####################################################################################################################
  Obs:
     - C�digo aberto a comunidade Delphi, desde que mantenha os dados dos autores e mantendo sempre o nome do IDEALIZADOR
       Marcelo;
     
####################################################################################################################
}

//Uncomment the directive for the type of application you will use. If it is a standalone application, use STANDALONE, and if it is operated by a user, use APPWINDOWS.
//DO NOT USE BOTH DIRECTIVES AT THE SAME TIME.
//Descomente a diretiva para o tipo de aplica��o que for usar, se for uma aplica��o que ir� executar sozinha em um servidor, utilize STANDALONE, se � uma aplica��o que vai ser operada por um usu�rio 
//utilize APPWINDOWS. 
//NAO USE AS DUAS DIRETIVAS AO MESMO TEMPO
{.$DEFINE APPWINDOWS} 
{$DEFINE STANDALONE} 

//CEF Version 120 or Current
{.$DEFINE CEFCurrentVersion}
{.$DEFINE Typebot}

{$DEFINE DELPHI_VERSION_UNKNOW}

// Delphi 5
{$IFDEF VER130}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
{$ENDIF}

// Delphi 6
{$IFDEF VER140}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
{$ENDIF}

// Delphi 7
{$IFDEF VER150}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
{$ENDIF}

// Delphi 8
{$IFDEF VER160}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
{$ENDIF}

// Delphi 2005
{$IFDEF VER170}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
{$ENDIF}

{$IFDEF VER180}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  // Delphi 2007
  {$IFDEF VER185}
    {$DEFINE DELPHI5_UP}
    {$DEFINE DELPHI6_UP}
    {$DEFINE DELPHI7_UP}
    {$DEFINE DELPHI8_UP}
    {$DEFINE DELPHI9_UP}
    {$DEFINE DELPHI10_UP}
    {$DEFINE DELPHI11_UP}
  // Delphi 2006
  {$ELSE}
    {$DEFINE DELPHI5_UP}
    {$DEFINE DELPHI6_UP}
    {$DEFINE DELPHI7_UP}
    {$DEFINE DELPHI8_UP}
    {$DEFINE DELPHI9_UP}
    {$DEFINE DELPHI10_UP}
  {$ENDIF}
{$ENDIF}

// Delphi 2009
{$IFDEF VER200}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
{$ENDIF}

//Delphi 2010
{$IFDEF VER210}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
{$ENDIF}

// Delphi XE
{$IFDEF VER220}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
{$ENDIF}

// Delphi XE2  (First FireMonkey and 64bit compiler)
{$IFDEF VER230}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
{$ENDIF}

// Delphi XE3
{$IFDEF VER240}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
  {$DEFINE DELPHI17_UP}
{$ENDIF}

// Delphi XE4
{$IFDEF VER250}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
  {$DEFINE DELPHI17_UP}
  {$DEFINE DELPHI18_UP}
{$ENDIF}

// Delphi XE5
{$IFDEF VER260}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
  {$DEFINE DELPHI17_UP}
  {$DEFINE DELPHI18_UP}
  {$DEFINE DELPHI19_UP}
{$ENDIF}

// Delphi XE6
{$IFDEF VER270}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
  {$DEFINE DELPHI17_UP}
  {$DEFINE DELPHI18_UP}
  {$DEFINE DELPHI19_UP}
  {$DEFINE DELPHI20_UP}
{$ENDIF}

// Delphi XE7
{$IFDEF VER280}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
  {$DEFINE DELPHI17_UP}
  {$DEFINE DELPHI18_UP}
  {$DEFINE DELPHI19_UP}
  {$DEFINE DELPHI20_UP}
  {$DEFINE DELPHI21_UP}
{$ENDIF}

// Delphi XE8
{$IFDEF VER290}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
  {$DEFINE DELPHI17_UP}
  {$DEFINE DELPHI18_UP}
  {$DEFINE DELPHI19_UP}
  {$DEFINE DELPHI20_UP}
  {$DEFINE DELPHI21_UP}
  {$DEFINE DELPHI22_UP}
{$ENDIF VER290}

// Rad Studio 10 - Delphi Seattle
{$IFDEF VER300}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
  {$DEFINE DELPHI17_UP}
  {$DEFINE DELPHI18_UP}
  {$DEFINE DELPHI19_UP}
  {$DEFINE DELPHI20_UP}
  {$DEFINE DELPHI21_UP}
  {$DEFINE DELPHI22_UP}
  {$DEFINE DELPHI23_UP}
{$ENDIF}

// Rad Studio 10.1 - Delphi Berlin
{$IFDEF VER310}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
  {$DEFINE DELPHI17_UP}
  {$DEFINE DELPHI18_UP}
  {$DEFINE DELPHI19_UP}
  {$DEFINE DELPHI20_UP}
  {$DEFINE DELPHI21_UP}
  {$DEFINE DELPHI22_UP}
  {$DEFINE DELPHI23_UP}
  {$DEFINE DELPHI24_UP}
{$ENDIF}

// Rad Studio 10.2 - Delphi Tokyo
{$IFDEF VER320}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
  {$DEFINE DELPHI17_UP}
  {$DEFINE DELPHI18_UP}
  {$DEFINE DELPHI19_UP}
  {$DEFINE DELPHI20_UP}
  {$DEFINE DELPHI21_UP}
  {$DEFINE DELPHI22_UP}
  {$DEFINE DELPHI23_UP}
  {$DEFINE DELPHI24_UP}
  {$DEFINE DELPHI25_UP}
{$ENDIF}

// Rad Studio 10.3 - Delphi Rio
{$IFDEF VER330}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
  {$DEFINE DELPHI17_UP}
  {$DEFINE DELPHI18_UP}
  {$DEFINE DELPHI19_UP}
  {$DEFINE DELPHI20_UP}
  {$DEFINE DELPHI21_UP}
  {$DEFINE DELPHI22_UP}
  {$DEFINE DELPHI23_UP}
  {$DEFINE DELPHI24_UP}
  {$DEFINE DELPHI25_UP}
  {$DEFINE DELPHI26_UP}
{$ENDIF}

// Rad Studio 10.4 - Delphi Sydney
{$IFDEF VER330}
  {$UNDEF DELPHI_VERSION_UNKNOW}
  {$DEFINE DELPHI5_UP}
  {$DEFINE DELPHI6_UP}
  {$DEFINE DELPHI7_UP}
  {$DEFINE DELPHI8_UP}
  {$DEFINE DELPHI9_UP}
  {$DEFINE DELPHI10_UP}
  {$DEFINE DELPHI11_UP}
  {$DEFINE DELPHI12_UP}
  {$DEFINE DELPHI14_UP}
  {$DEFINE DELPHI15_UP}
  {$DEFINE DELPHI16_UP}
  {$DEFINE DELPHI17_UP}
  {$DEFINE DELPHI18_UP}
  {$DEFINE DELPHI19_UP}
  {$DEFINE DELPHI20_UP}
  {$DEFINE DELPHI21_UP}
  {$DEFINE DELPHI22_UP}
  {$DEFINE DELPHI23_UP}
  {$DEFINE DELPHI24_UP}
  {$DEFINE DELPHI25_UP}
  {$DEFINE DELPHI26_UP}
  {$DEFINE DELPHI27_UP}
{$ENDIF}