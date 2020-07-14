import {
  inputRules,
  textblockTypeInputRule,
  wrappingInputRule,
  emDash,
  ellipsis,
  InputRule,
} from 'prosemirror-inputrules';
import schema from './schema';

export default inputRules({
  rules: [
    blockQuoteRule(schema.nodes.blockquote),
    bulletListRule(schema.nodes.bullet_list),
    codeBlockRule(schema.nodes.code_block),
    orderedListRule(schema.nodes.ordered_list),
    headingRule(schema.nodes.heading, 6),
    insertImageWithMarkdown(),
    emDash,
    ellipsis,
  ],
});

// : (NodeType) → InputRule
// Given a blockquote node type, returns an input rule that turns `"> "`
// at the start of a textblock into a blockquote.
export function blockQuoteRule(nodeType) {
  return wrappingInputRule(/^\s*>\s$/, nodeType);
}

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
  return wrappingInputRule(
    /^(\d+)\.\s$/,
    nodeType,
    (match) => ({ order: +match[1] }),
    (match, node) => node.childCount + node.attrs.order == +match[1]
  );
}

// : (NodeType) → InputRule
// Given a list node type, returns an input rule that turns a bullet
// (dash, plush, or asterisk) at the start of a textblock into a
// bullet list.
export function bulletListRule(nodeType) {
  return wrappingInputRule(/^\s*([-+*])\s$/, nodeType);
}

// : (NodeType, number) → InputRule
// Given a node type and a maximum level, creates an input rule that
// turns up to that number of `#` characters followed by a space at
// the start of a textblock into a heading whose level corresponds to
// the number of `#` signs.
export function headingRule(nodeType, maxLevel) {
  return textblockTypeInputRule(
    new RegExp('^(#{2,' + maxLevel + '})\\s$'),
    nodeType,
    (match) => ({ level: match[1].length })
  );
}

export function insertImageWithMarkdown() {
  return new InputRule(/^\!\[.*\]\(.+\)$/, function (state, match, start, end) {
    const { tr } = state;
    const [alt, src] = match[0].substring(2, match[0].length - 1).split('](');

    tr.replaceWith(start, end, schema.nodes.image.create({ alt, src }));

    return tr;
  });
}
