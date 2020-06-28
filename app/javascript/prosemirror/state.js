import { EditorState } from 'prosemirror-state';
import { keymap } from 'prosemirror-keymap';
import { history } from 'prosemirror-history';
import { baseKeymap } from 'prosemirror-commands';
import { buildKeymap } from './keymap';
import schema from './schema';
import inputRules from './rules';
import { linkPaste } from './plugins/linkPaste';

export let state = EditorState.create({
  schema,
  plugins: [
    history(),
    inputRules,
    keymap(buildKeymap(schema)),
    keymap(baseKeymap),
    linkPaste,
  ],
});
