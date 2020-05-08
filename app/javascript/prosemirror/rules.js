import { inputRules, textblockTypeInputRule, wrappingInputRule } from 'prosemirror-inputrules';
import schema from './schema';

export default inputRules({ rules: [
  bulletListRule(schema.nodes.bullet_list),
  codeBlockRule(schema.nodes.code_block),
  orderedListRule(schema.nodes.ordered_list),
]})

// : (NodeType) → InputRule
// Given a code block node type, returns an input rule that turns a
// textblock starting with three backticks into a code block.
export function codeBlockRule(nodeType) {
  return textblockTypeInputRule(/^```$/, nodeType);
}

// : (NodeType) → InputRule
// Given a list node type, returns an input rule that turns a number
// followed by a dot at the start of a textblock into an ordered list.
export function orderedListRule(nodeType) {
  return wrappingInputRule(/^(\d+)\.\s$/, nodeType, match => ({order: +match[1]}),
                          (match, node) => node.childCount + node.attrs.order == +match[1]);
}

// : (NodeType) → InputRule
// Given a list node type, returns an input rule that turns a bullet
// (dash, plush, or asterisk) at the start of a textblock into a
// bullet list.
export function bulletListRule(nodeType) {
  return wrappingInputRule(/^\s*([-+*])\s$/, nodeType);
}
