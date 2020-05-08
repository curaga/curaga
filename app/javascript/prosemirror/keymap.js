import { baseKeymap, toggleMark } from 'prosemirror-commands';
import { keymap } from 'prosemirror-keymap';
import schema from './schema';

let untitledKeymap = {
  'Mod-b': toggleMark(schema.marks.strong),
  'Mod-i': toggleMark(schema.marks.em),
};

export default keymap({...baseKeymap, ...untitledKeymap});
