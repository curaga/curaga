import { toggleMark } from 'prosemirror-commands';
import { Plugin } from 'prosemirror-state';
import schema from '../schema';

export let linkPaste = new Plugin({
  props: {
    handlePaste: (view, event, slice) => {
      const text = event.clipboardData.getData('text/plain');
      const { state, dispatch } = view;

      if (isUrl(text) && !state.selection.empty) {
        toggleMark(schema.marks.link, { href: text })(state, dispatch);

        return true;
      }
    },
  },
});

function isUrl(text) {
  try {
    new URL(text);
    return true;
  } catch (err) {
    return false;
  }
}
