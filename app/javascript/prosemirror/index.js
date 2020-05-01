import { baseKeymap, toggleMark } from 'prosemirror-commands';
import { inputRules, textblockTypeInputRule, wrappingInputRule } from 'prosemirror-inputrules';
import { keymap } from 'prosemirror-keymap';
import { Schema } from 'prosemirror-model';
import { schema } from 'prosemirror-schema-basic';
import { EditorState } from 'prosemirror-state';
import { EditorView } from 'prosemirror-view';
import { addListNodes } from 'prosemirror-schema-list';

let untitledSchema = new Schema({
  nodes: addListNodes(schema.spec.nodes, 'paragraph block*', 'block'),
  marks: schema.spec.marks,
});

let untitledKeymap = keymap({
  'Mod-b': toggleMark(untitledSchema.marks.strong),
  'Mod-i': toggleMark(untitledSchema.marks.em),
});

// : (NodeType) → InputRule
// Given a code block node type, returns an input rule that turns a
// textblock starting with three backticks into a code block.
function codeBlockRule(nodeType) {
  return textblockTypeInputRule(/^```$/, nodeType);
}

// : (NodeType) → InputRule
// Given a list node type, returns an input rule that turns a number
// followed by a dot at the start of a textblock into an ordered list.
function orderedListRule(nodeType) {
  return wrappingInputRule(/^(\d+)\.\s$/, nodeType, match => ({order: +match[1]}),
                           (match, node) => node.childCount + node.attrs.order == +match[1]);
}

// : (NodeType) → InputRule
// Given a list node type, returns an input rule that turns a bullet
// (dash, plush, or asterisk) at the start of a textblock into a
// bullet list.
function bulletListRule(nodeType) {
  return wrappingInputRule(/^\s*([-+*])\s$/, nodeType);
}

document.addEventListener('DOMContentLoaded', function() {
  let state = EditorState.create({
    schema: untitledSchema,
    plugins: [
      inputRules({ rules: [
        bulletListRule(untitledSchema.nodes.bullet_list),
        codeBlockRule(untitledSchema.nodes.code_block),
        orderedListRule(untitledSchema.nodes.ordered_list),
      ]}),
      keymap(baseKeymap),
      untitledKeymap,
    ],
  });

  let view = new EditorView(document.body, {
    state,
  });
});
