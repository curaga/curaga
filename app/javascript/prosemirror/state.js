import { EditorState } from 'prosemirror-state';
import keymap from './keymap';
import schema from './schema';
import inputRules from './rules';

export let state = EditorState.create({
  schema,
  plugins: [
    inputRules,
    keymap,
  ],
});
