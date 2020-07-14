import Editor from '../editor.svelte';

document.addEventListener('turbolinks:load', () => loadEditor());

function loadEditor() {
  const el = document.querySelector('#curaga-editor');

  if (typeof el != 'undefined' && el != null) {
    const doc =
      el.querySelector('input[type=hidden]').value || '{"doc": {"type":"doc"}}';

    const editor = new Editor({
      target: el,
      hydrate: true,
      props: {
        doc,
      },
    });

    window.editor = editor;
  }
}
