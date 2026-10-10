# Gestão de grupos (TWPPConnect)

Todos os métodos de gestão de grupos aceitam `xSeuID`, `xSeuID2`, `xSeuID3` e `xSeuID4` (opcionais, padrão vazio).
Os valores voltam **sem alteração** no evento de retorno e servem para correlacionar a resposta com a chamada
(por exemplo: id da ação em uma fila, passo do fluxo, usuário). Chamadas antigas, sem `SeuID`, continuam compilando.

> Requisito: o `js.abr` carregado no navegador precisa ser o da mesma versão do componente (5.2.0.0 ou superior).

## Fluxo

```pascal
TWPPConnect1.OnGet_GroupActionResponse := GroupActionResponse;

TWPPConnect1.GroupAddParticipant('120363000000000000@g.us', '5511999990000', 'MINHA_FILA', '1234', 'A0');

procedure TForm1.GroupActionResponse(const Response: TGroupActionResponseClass);
begin
  // Response.Seuid = 'MINHA_FILA', Seuid2 = '1234', Seuid3 = 'A0'
  if Response.Success then
    // concluiu
  else
    // Response.statusCode, Response.ErrorCode, Response.Error
end;
```

Sucesso **e** falha das ações chegam no mesmo evento (`OnGet_GroupActionResponse`), nunca em `OnGet_ErrorResponse`.
As consultas (`GetGroupInfo`, `GetGroupMembershipRequests`, `GetGroupList`) devolvem os dados no evento próprio quando
dão certo e, quando falham, devolvem `OnGet_GroupActionResponse` com `Success = False` e os mesmos `SeuID`.

## Métodos, `Action` e eventos

| Método | `Action` | Evento de sucesso |
|---|---|---|
| `createGroup(nome, numeros)` (vários números separados por vírgula) | `CREATE` | `OnGet_GroupActionResponse` (`GroupId` = jid do grupo criado) |
| `GroupAddParticipant(jid, numero)` | `ADD_PARTICIPANT` | `OnGet_GroupActionResponse` |
| `GroupRemoveParticipant(jid, numero)` | `REMOVE_PARTICIPANT` | `OnGet_GroupActionResponse` |
| `GroupPromoteParticipant(jid, numero)` | `PROMOTE_PARTICIPANT` | `OnGet_GroupActionResponse` |
| `GroupDemoteParticipant(jid, numero)` | `DEMOTE_PARTICIPANT` | `OnGet_GroupActionResponse` |
| `SetGroupDescription(jid, texto)` | `SET_DESCRIPTION` | `OnGet_GroupActionResponse` |
| `GroupSetSubject(jid, assunto)` | `SET_SUBJECT` | `OnGet_GroupActionResponse` |
| `SetGroupPicture(jid, arquivo)` | `SET_PICTURE` | `OnGet_GroupActionResponse` |
| `GroupMsgAdminOnly(jid)` / `GroupMsgAll(jid)` (só admins enviam mensagens) | `SET_ANNOUNCE` | `OnGet_GroupActionResponse` |
| `GroupEditAdminOnly(jid)` / `GroupEditAll(jid)` (só admins editam os dados do grupo) | `SET_RESTRICT` | `OnGet_GroupActionResponse` |
| `GroupRemoveInviteLink(jid)` | `REVOKE_INVITE` | `OnGet_GroupActionResponse` (`Data` = `{"inviteCode","inviteLink"}`) |
| `GetGroupInviteLink(jid, SeuID...)` | `INVITE_LINK` | `OnGet_GroupActionResponse` (`Data` = `{"inviteCode","inviteLink"}`) |
| `GroupLeave(jid)` | `LEAVE` | `OnGet_GroupActionResponse` |
| `groupDelete(jid)` (exclui a conversa, não sai do grupo) | `DELETE` | `OnGet_GroupActionResponse` |
| `GroupJoinViaLink(link)` | `JOIN` | `OnGet_GroupActionResponse` (`Data` = `{"id","pendingApproval"}`) |
| `GroupMembershipApprove(jid, contato)` / `GroupMembershipReject(jid, contato)` | `MEMBERSHIP_APPROVE` / `MEMBERSHIP_REJECT` | `OnGet_GroupActionResponse` |
| `GetGroupInfo(jid)` | `INFO` | `OnGet_GroupInfoResponse` |
| `GetGroupMembershipRequests(jid)` | `MEMBERSHIP_REQUESTS` | `OnGet_GroupMembershipRequestsResponse` |
| `GetGroupList` | `LIST` | `OnGet_GroupListResponse` |

`GetGroupInviteLink` **sem nenhum SeuID** mantém o comportamento antigo (evento `OnGetInviteGroup`, que traz só o
código do convite). Com algum `SeuID`, o retorno vem em `OnGet_GroupActionResponse`.

`GroupLeave` agora sai de fato do grupo (nas versões anteriores a 5.2.0.0 o comando JS era vazio e não fazia nada).

## `TGroupActionResponseClass`

| Campo | Descrição |
|---|---|
| `Seuid`, `Seuid2`, `Seuid3`, `Seuid4` | Valores informados na chamada |
| `Action` | Ver tabela acima |
| `GroupId` | jid do grupo (no `CREATE` é o grupo criado; no `JOIN` é o grupo em que entrou; vazio em falha) |
| `Success` | `True` quando a operação concluiu |
| `statusCode` | Categoria do resultado (tabela abaixo) |
| `ErrorCode` | Código do WA-JS (tabela de erros). Vazio quando não há código |
| `Error` | Mensagem do erro (em inglês, vinda do WA-JS, ou em português quando validada no componente) |
| `Data` | JSON (string) com o retorno do WA-JS, quando existe |

### `statusCode`

| Valor | Significado | Quando acontece |
|---|---|---|
| `0` | Sucesso | `Success = True` |
| `303` | Erro do WA-JS / WhatsApp | A chamada lançou exceção. `ErrorCode` e `Error` explicam |
| `304` | `ADD_PARTICIPANT` recusado | O WhatsApp devolveu código diferente de 200 para o participante (ver abaixo). `Error` traz `"<id>: <mensagem>"` e `Data` o mapa completo |
| `305` | Parâmetro inválido (validação local) | O componente barrou antes de enviar ao navegador: jid vazio, número inválido, assunto vazio, arquivo inexistente ou vazio. `ErrorCode = invalid_parameter`, `Error` com a causa |

Se o componente não estiver conectado ao WhatsApp Web, o método levanta exceção Delphi (`MSG_ConfigCEF_ExceptConnetServ`)
em vez de gerar o evento.

### Códigos de `ADD_PARTICIPANT` (campo `code` em `Data`)

| `code` | Mensagem do WA-JS | Significado |
|---|---|---|
| `200` | OK | Adicionado |
| `403` | Can't join this group because the number was restricted it. | O contato restringiu quem pode adicioná-lo a grupos. `invite_code` em `Data` permite enviar o convite por mensagem |
| `409` | Can't join this group because the number is already a member of it. | Já é membro |
| `421` | Member not added, awaiting approval! | Ficou pendente de aprovação dos administradores (grupo com aprovação de entrada) |
| outro | Can't Join., unknown error | Não mapeado pelo WA-JS |

### `ErrorCode` (WA-JS) das ações de grupo

| `ErrorCode` | Quando | O que fazer |
|---|---|---|
| `not_a_group` | O id informado não é de um grupo (`@g.us`) | Conferir o jid |
| `group_not_exist` | O grupo não existe / a conta não o conhece | Conferir o jid e se a conta ainda participa |
| `group_you_are_not_admin` | Ação que exige admin (adicionar, remover, convite, etc.) e a conta não é admin | Promover a conta conectada ou usar outra |
| `group_you_are_restricted_member` | A conta está restrita no grupo | Pedir liberação a um admin |
| `you_are_not_allowed_set_group_subject` | Sem permissão para trocar o assunto (grupo com "só admins editam") | Ser admin ou usar `GroupEditAll` antes |
| `you_are_not_allowed_set_group_description` | Sem permissão para trocar a descrição | Idem |
| `you_are_not_allowed_set_group_property` | Sem permissão para alterar a propriedade (`SET_RESTRICT`) | Ser admin |
| `you_are_not_allowed_set_ephemeral_setting` | Sem permissão para alterar mensagens temporárias / `SET_ANNOUNCE` | Ser admin |
| `invalid_ephemeral_duration` | Duração de mensagens temporárias inválida | Usar 0, 86400, 604800 ou 7776000 |
| `participant_not_exists` | `CREATE`: um participante não tem WhatsApp | Conferir o número |
| `group_add_participant_error` | `ADD_PARTICIPANT`: o WhatsApp respondeu com status >= 400 | Tentar novamente; conferir limites do grupo |
| `not_valid_group_participants` | `REMOVE_PARTICIPANT`: nenhum dos informados está no grupo | Conferir o número / se usa `@lid` |
| `group_participant_is_not_a_group_member` | Participante não é membro do grupo | Conferir o número |
| `group_participant_not_found` | Participante não encontrado no grupo | Conferir o número / `@lid` |
| `group_participant_is_already_a_group_admin` | `PROMOTE_PARTICIPANT` em quem já é admin | Ignorar |
| `group_participant_is_already_not_a_group_admin` | `DEMOTE_PARTICIPANT` em quem já não é admin | Ignorar |
| `error_on_accept_membership_request` | `MEMBERSHIP_APPROVE` falhou (sem pedido pendente, sem ser admin, etc.) | O WA-JS esconde a causa; conferir com `GetGroupMembershipRequests` |
| `error_on_reject_membership_request` | `MEMBERSHIP_REJECT` falhou | Idem |
| `invalid_invite_code` | `JOIN` com código/link inválido ou expirado | Gerar novo convite |
| `invalid_wid` | Id (grupo ou contato) em formato inválido | Usar `<digitos>`, `<digitos>@c.us`, `<digitos>@lid` ou `...@g.us` |
| `community_function_not_available` | Funções de comunidade indisponíveis nesta versão do WhatsApp Web | Atualizar o WA-JS |
| *(vazio)* | Erro sem código (`statusCode = 303`) | Ler `Error` |

Os códigos são os do WA-JS embutido no `js.abr`; podem mudar quando o WA-JS for atualizado.

## Metadados e listas

### `TGroupInfoClass` (`GetGroupInfo` → `OnGet_GroupInfoResponse`)

`GroupId`, `Subject`, `Description`, `Owner`, `OwnerPhone`, `Creation` (epoch em segundos), `Announce` (só admins enviam),
`Restrict` (só admins editam os dados), `MemberAddMode` (`admin_add` / `all_member_add`), `MembershipApprovalMode`
(`on` / `off` / vazio quando o WhatsApp Web não expõe), `IsLidAddressingMode`, `EphemeralDuration`, `Size`, `InviteCode` e
`InviteLink` (vazios se a conta não for admin) e `Participants[]` (`Id`, `Jid`, `Lid`, `Phone`, `Pushname`, `Name`, `IsAdmin`,
`IsSuperAdmin`).

`Jid`/`Phone` ficam vazios quando o WhatsApp só conhece o LID do participante (sem mapeamento LID → telefone).
Não existe no WA-JS uma forma de **alterar** o modo de aprovação de entrada.

### `TGroupMembershipRequestsClass` (`GetGroupMembershipRequests` → `OnGet_GroupMembershipRequestsResponse`)

`GroupId` e `Requests[]` (`Id`, `Jid`, `Lid`, `Phone`, `Pushname`, `Name`, `AddedBy`, `RequestMethod`, `T` em epoch).

### `TGroupListClass` (`GetGroupList` → `OnGet_GroupListResponse`)

`Groups[]`: `Id`, `Name`, `Subject`, `Owner`, `Creation`, `Size`, `Announce`, `Restrict`, `IsAdmin` (a conta conectada é admin).
Usa apenas dados já carregados: `Size` e as flags podem vir `0`/`False` para grupos cujo metadata ainda não foi carregado.
Para dados completos de um grupo use `GetGroupInfo`.

## Evento de mudanças no grupo (`OnGetgroup_participant_changed`)

Dispara só com `Evento_group_participant_changed` habilitado. `event`:

| Campo | Descrição |
|---|---|
| `action` | `add`, `remove`, `promote`, `demote`, `join` (entrou por link) ou `leave` (saiu sozinho) |
| `operation` | Ação original do WhatsApp (`add`, `remove`, `promote`, `demote`) |
| `author` / `authorPhone` / `authorPushName` | Quem fez a ação (LID ou `@c.us`) / `@c.us` quando resolvido / nome |
| `groupId` | jid do grupo |
| `participants` / `participantsPhone` | Envolvidos / `@c.us` de cada um, na mesma ordem (vazio quando não resolvido) |

O WhatsApp não informa um "motivo" além do `action`.
