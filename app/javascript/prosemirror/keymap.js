import { toggleMark } from 'prosemirror-commands';
import { undo, redo } from 'prosemirror-history';
import { splitListItem } from 'prosemirror-schema-list';

export function buildKeymap(schema) {
  let keys = {}, type;

  function bind(key, cmd) {
    keys[key] = cmd;
  }

  bind('Mod-z', undo);
  bind('Shift-Mod-z', redo);

  bind('Mod-b', toggleMark(schema.marks.strong));
  bind('Mod-i', toggleMark(schema.marks.em));

  if (type = schema.nodes.list_item) {
    bind('Enter', splitListItem(type));
  }

  return keys;
}
