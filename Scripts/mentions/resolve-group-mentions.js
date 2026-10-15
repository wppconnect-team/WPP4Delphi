// WPP4Delphi: resolve phone tokens without changing the bundled WA-JS.
window.WPP.resolveGroupPhoneMentions = async function (chatid, text, options) {
  const original = { text: text, options: options };
  if (typeof chatid !== 'string' || !chatid.endsWith('@g.us') ||
      typeof text !== 'string') return original;
  // Match complete standalone tokens, including punctuation-delimited tokens.
  const tokens = /(^|[^\p{L}\p{N}_@])@(\d+)(?![\p{L}\p{N}_@])/gu;
  const phones = Array.from(new Set(Array.from(text.matchAll(tokens), m => m[2])));
  if (!phones.length) return original;
  const diagnostic = (phone, reason) => {
    try { console.warn('[WPP4Delphi mentions]', { chatid: chatid, phone: phone, reason: reason }); }
    catch (_) { /* Diagnostics must never prevent sending. */ }
  };
  if (options && options.mentionedList != null && !Array.isArray(options.mentionedList)) {
    diagnostic(null, 'Invalid mentionedList; preserving WA-JS validation');
    return original;
  }
  try {
    const participants = await WPP.group.getParticipants(chatid);
    const serialize = id => typeof id === 'string' ? id : id && id._serialized ||
      (id && typeof id.toString === 'function' ? id.toString() : '');
    const members = new Set(participants.map(p => serialize(p.id)));
    const list = options && options.mentionedList ? options.mentionedList.slice() : [];
    const keys = new Set(list.map(serialize));
    const resolved = new Map();
    const automatic = !options || options.detectMentioned !== false;
    for (const phone of phones) {
      const pn = phone + '@c.us';
      // An explicit mention (including an explicit LID token) takes precedence.
      const explicit = Array.from(keys).find(id => id === pn || id === phone + '@lid');
      if (!automatic && !explicit) continue;
      if (explicit && members.has(explicit)) continue;
      try {
        const entry = await WPP.contact.getPnLidEntry(pn);
        const lid = entry && entry.lid && entry.lid._serialized;
        if (typeof lid === 'string' && /^\d+@lid$/.test(lid) && members.has(lid)) {
          resolved.set(phone, lid);
          // Replace an explicit PN with its verified participant LID.
          if (keys.has(pn)) {
            for (let i = list.length - 1; i >= 0; i--) {
              if (serialize(list[i]) === pn) list.splice(i, 1);
            }
            keys.delete(pn);
          }
          if (!keys.has(lid)) { list.push(lid); keys.add(lid); }
        } else if (members.has(pn)) {
          if (!keys.has(pn)) { list.push(pn); keys.add(pn); }
        } else {
          diagnostic(phone, lid ? 'Mapped LID is not a group participant' : 'PN/LID mapping unavailable');
        }
      } catch (error) {
        diagnostic(phone, error && error.message || String(error));
        // Preserve a valid PN participant even when the mapping cache fails.
        if (members.has(pn) && !keys.has(pn)) { list.push(pn); keys.add(pn); }
      }
    }
    // A nonempty explicit list suppresses native numeric redetection.
    // Keep detectMentioned unchanged so native @all retains its behavior.
    const nextOptions = Object.assign({}, options);
    if (list.length) nextOptions.mentionedList = list;

    return {
      text: text.replace(tokens, (token, prefix, phone) =>
        resolved.has(phone) ? prefix + '@' + resolved.get(phone).split('@')[0] : token),
      options: nextOptions
    };
  } catch (error) {
    diagnostic(null, error && error.message || String(error));
    return original;
  }
};
