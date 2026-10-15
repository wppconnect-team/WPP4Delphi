const fs = require('node:fs');
const vm = require('node:vm');
const assert = require('node:assert/strict');
const helper = fs.readFileSync(__dirname + '/resolve-group-mentions.js', 'utf8');
async function run(path) {
  let lookups = [], sends = [], warnings = [];
  let members = ['90001@lid', '90002@lid', '777@c.us'];
  const WPP = {
    group: { getParticipants: async () => members.map(id => ({id: {_serialized: id}})) },
    contact: {
      getPnLidEntry: async pn => {
        lookups.push(pn);
        if (pn === '888@c.us') throw Error('cache failure');
        return {lid: {_serialized: ({'111@c.us':'90001@lid', '222@c.us':'90002@lid',
          '333@c.us':'99999@lid'})[pn]}};
      },
      queryExists: async wid => ({wid: {_serialized: wid}})
    },
    chat: {sendTextMessage: async (...args) => {sends.push(args); return {id: 'simulated'};}}
  };
  const context = vm.createContext({window:{WPP}, WPP, WAPI:{ResolveFromJid:async()=>''},
    console:{warn:(...args)=>warnings.push(args), log:()=>{}}, SetConsoleMessage:()=>{}});
  vm.runInContext(helper, context);
  const resolve = WPP.resolveGroupPhoneMentions;
  let r = await resolve('test@g.us', '@111 @222 @111 @1119 x@111 @111abc @all', {linkPreview:false});
  assert.equal(r.text, '@90001 @90002 @90001 @1119 x@111 @111abc @all');
  assert.deepEqual(Array.from(r.options.mentionedList), ['90001@lid','90002@lid']);
  assert.equal(lookups.filter(x=>x==='111@c.us').length, 1);
  assert.equal(r.options.linkPreview, false);
  const options = {mentionedList:['90002@lid'], detectMentioned:true, delay:37};
  r = await resolve('test@g.us','@111 @90002 @all',options);
  assert.deepEqual(Array.from(r.options.mentionedList), ['90002@lid','90001@lid']);
  assert.equal(r.options.detectMentioned,true);
  assert.deepEqual(options.mentionedList,['90002@lid']);
  r = await resolve('test@g.us','@333 @888 @777',{});
  assert.equal(r.text,'@333 @888 @777');
  assert.deepEqual(Array.from(r.options.mentionedList),['777@c.us']);
  assert.ok(warnings.length>=2);
  lookups=[];
  for (const [chat,text,opts] of [['111@c.us','@111',options],['test@g.us','hello @all',options],
      ['test@g.us','@111',{detectMentioned:false}]]) {
    r = await resolve(chat,text,opts); assert.equal(r.text,text);
  }
  assert.equal(lookups.length,0);
  WPP.group.getParticipants = async()=>{throw Error('offline');};
  r = await resolve('test@g.us','@111',options);
  assert.equal(r.text,'@111'); assert.equal(r.options,options);
  WPP.group.getParticipants = async()=>members.map(id=>({id}));
  const source = fs.readFileSync(path,'utf8');
  const start = source.indexOf('window.WPP.SendTextMessageNew = async function');
  const end = source.indexOf('\n};',start)+4;
  assert.ok(start>=0 && end>start);
  vm.runInContext(source.slice(start,end),context);
  await WPP.SendTextMessageNew('test@g.us','@111 @111',{},'test-id');
  assert.equal(sends.length,1);
  assert.equal(sends[0][1],'@90001 @90001');
  assert.deepEqual(Array.from(sends[0][2].mentionedList),['90001@lid']);
  WPP.chat.sendTextMessage = async()=>{sends.push('failed');throw Error('send failed');};
  await WPP.SendTextMessageNew('test@g.us','@111',{});
  assert.equal(sends.length,2); // No retry even on failure.
  console.log('PASS',path);
}
(async()=>{for(const p of process.argv.slice(2)) await run(p);})().catch(e=>{console.error(e);process.exitCode=1;});
