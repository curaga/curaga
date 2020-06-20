import { EditorState } from 'prosemirror-state';
import { keymap } from 'prosemirror-keymap';
import { baseKeymap } from 'prosemirror-commands';
import { buildKeymap } from './keymap';
import schema from './schema';
import inputRules from './rules';
import { linkPaste } from './plugins/linkPaste';

export let state = EditorState.create({
  schema,
  plugins: [
    inputRules,
    keymap(buildKeymap(schema)),
    keymap(baseKeymap),
    linkPaste,
  ],
});
