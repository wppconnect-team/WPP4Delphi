[English](./README.md) | **Português (Brasil)**

<p align="center">
  <a href="https://wppconnect.io/">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="https://wppconnect-team.github.io/brand/wppconnect-dark.png" />
      <img src="https://wppconnect-team.github.io/brand/wppconnect-light.png" alt="WPPConnect" width="220" height="121" />
    </picture>
  </a>
</p>

# WPP4Delphi

Integre o WhatsApp Web a aplicações Delphi e Lazarus.

Um projeto do ecossistema WPPConnect, mantido pela WPPConnect Team.

[Primeiros passos](#primeiros-passos) | [Documentação](#documentação) | [Como contribuir](#como-contribuir) | [Apoie a WPPConnect](#apoie-o-projeto)

[![License: Apache-2.0](https://img.shields.io/badge/license-Apache--2.0-blue)](./LICENSE) [![Documentation](https://img.shields.io/badge/docs-WPPConnect-blue)](https://wppconnect.io/) [![Open Collective](https://img.shields.io/badge/Open%20Collective-WPPConnect-blue)](https://opencollective.com/wppconnect)

## Visão geral

Para desenvolvedores Object Pascal. `TWPPConnect` incorpora Chromium pelo CEF4Delphi, injeta WA-JS e converte respostas assíncronas em objetos e eventos Delphi/Lazarus. O pacote de componentes é `TWPP4DelphiCollection`.

## Funcionalidades

- Pareamento por QR, mensagens de texto/mídia, contatos, conversas, grupos e callbacks de eventos.
- Código compartilhado para Delphi VCL e Lazarus LCL/FPC, com projetos de demonstração.

## Primeiros passos

Exige Delphi ou Lazarus/FPC, CEF4Delphi, binários CEF correspondentes e WA-JS. As instruções Lazarus existentes usam FPC 3.2.2. O Boss pode baixar o projeto:

```sh
boss install github.com/wppconnect-team/WPP4Delphi
```

1. Instale o [CEF4Delphi](https://github.com/salvadordf/CEF4Delphi) e adicione sua pasta de fontes ao library path da IDE. Use binários da mesma versão CEF e arquitetura de destino.
2. Adicione `Source/Model`, `Source/Services`, `Source/View`, `Source/Other` e a pasta adequada de `Packages/Compilados` ao library path do Delphi. Compile e instale [TWPP4DelphiCollection.dpk](Packages/TWPP4DelphiCollection.dpk). Builds CEF mais novos podem exigir a diretiva existente `CEFCurrentVersion`; confira as notas técnicas.
3. Abra [Demo/WPPConnectDemo.dpr](Demo/WPPConnectDemo.dpr), compile e coloque os binários CEF correspondentes e [ConfTWPPConnect.ini](Demo/BIN/ConfTWPPConnect.ini) junto do executável. Execute a demonstração e siga o pareamento por QR.
4. No Lazarus instale DCPcrypt, Indy (`indylaz`) e CEF4Delphi antes de [twpp4delphicollection.lpk](Packages/twpp4delphicollection.lpk). O código compartilhado contém unidades FPC de compatibilidade JSON/threads.

As instruções antigas de download do CEF 109 foram preservadas nas notas de referência para ambientes legados; elas não comprovam compatibilidade ou segurança do WhatsApp Web atual nesses sistemas.

## Configuração

Revise `ConfTWPPConnect.ini` e os formulários de demonstração antes de usar sua conta. As versões do navegador, WA-JS e binários nativos devem corresponder ao ambiente escolhido. O demo histórico de OpenAI foi preservado apenas como referência; o exemplo antigo de modelo/API precisa ser atualizado antes do uso.

## Documentação

- [Especificação técnica](./SPEC.md)
- [Demonstração Delphi](./Demo/)
- [Notas da demonstração Lazarus](./Demo%20Lazarus/README.md)
- [CEF4Delphi](https://github.com/salvadordf/CEF4Delphi)
- [Detalhes técnicos e agradecimentos preservados](documentation/readme-reference.md)

## Ecossistema WPPConnect

| Projeto | Finalidade | Quando usar |
| --- | --- | --- |
| [WPPConnect/WA-JS](https://github.com/wppconnect-team/wa-js) | Exponha funções do WhatsApp Web pela API `WPP` no navegador. | Executar código no navegador dentro do WhatsApp Web. |
| [WPPConnect](https://github.com/wppconnect-team/wppconnect) | Controle o WhatsApp Web em aplicações Node.js. | Incorporar automação a uma aplicação Node.js. |

## Apoie o projeto

A WPPConnect é mantida por uma comunidade de código aberto. Seu apoio ajuda a financiar a manutenção, a infraestrutura, a documentação e o trabalho das pessoas que desenvolvem o ecossistema.

Se a WPPConnect ajuda seu projeto ou sua empresa, considere fazer uma contribuição pontual ou apoiar de forma recorrente.

**[Apoie a WPPConnect no Open Collective](https://opencollective.com/wppconnect)**

As contribuições são voluntárias. Consulte a página oficial para acompanhar as informações financeiras atuais. Você também pode ajudar com código, testes, documentação, traduções e relatos de problemas bem descritos.

Beneficiários oficiais adicionais em [.github/FUNDING.yml](.github/FUNDING.yml): [joaosouz4dev](https://github.com/sponsors/joaosouz4dev), [manfe](https://github.com/sponsors/manfe).

## Como contribuir

Contribuições de código, testes, exemplos, documentação e traduções são bem-vindas. Para mudanças maiores, discuta a proposta em uma issue primeiro. Ao relatar um problema, informe as versões do projeto/runtime, uma reprodução mínima e logs sem dados sensíveis. Atualize `README.md` e `README.pt-BR.md` na mesma alteração quando mudar instalação, configuração, funcionalidades, exemplos, licença ou arrecadação.

Exemplos e testes que dependem de conta exigem validação separada com uma conta de teste autorizada. Nunca anexe credenciais ou arquivos de sessão a uma issue.

## Comunidade e suporte

Use as [issues do repositório](https://github.com/wppconnect-team/WPP4Delphi/issues) para bugs reproduzíveis e propostas de funcionalidades. Para dúvidas de uso, participe pelos canais oficiais:

- [Discord](https://discord.gg/JU5JGGKGNG)
- [Telegram](https://t.me/wppconnect)
- [YouTube](https://www.youtube.com/c/wppconnect)

Este projeto é independente e não é afiliado nem endossado pelo WhatsApp ou pela Meta. Siga os termos aplicáveis e obtenha autorização para operações de conta e mensagens.

## Licença

[Apache License 2.0 (Apache-2.0)](./LICENSE).

Copyright 2022 WPPConnect Team.

O documento jurídico original e os avisos de autoria existentes são preservados. Componentes de terceiros mantêm seus próprios termos.
