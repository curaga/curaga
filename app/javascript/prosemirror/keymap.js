import { toggleMark } from 'prosemirror-commands';
import { splitListItem } from 'prosemirror-schema-list';

export function buildKeymap(schema) {
  let keys = {}, type;

  function bind(key, cmd) {
    keys[key] = cmd;
  }

  bind('Mod-b', toggleMark(schema.marks.strong));
  bind('Mod-i', toggleMark(schema.marks.em));

  if (type = schema.nodes.list_item) {
    bind('Enter', splitListItem(type));
  }

  return keys;
}
