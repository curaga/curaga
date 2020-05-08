import Editor from '../editor.svelte'

const doc = '{"doc":{"type":"doc","content":[{"type":"paragraph","content":[{"type":"text","text":"Hello there. Now this works."}]},{"type":"code_block","content":[{"type":"text","text":"Testing a code block"}]},{"type":"paragraph","content":[{"type":"text","marks":[{"type":"em"}],"text":"And some italic text."}]}]},"selection":{"type":"text","anchor":51,"head":51}}';

document.addEventListener('DOMContentLoaded', () => {
  const editor = new Editor({
    target: document.body,
    props: {
      doc
    }
  });

  window.editor = editor;
})
