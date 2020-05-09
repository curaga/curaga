<script>
  import { onMount, onDestroy } from 'svelte';
  import { EditorView } from 'prosemirror-view';
  import { state } from 'prosemirror/state';
  import 'prosemirror-view/style/prosemirror.css';

  export let doc;

  let editorState = state;

  const jsonDoc = JSON.parse(doc);
  editorState.doc = editorState.schema.nodeFromJSON(jsonDoc.doc);

  onMount(() => {
    let view = new EditorView(document.getElementById('prosemirror'), {
      state: editorState,
      editable: () => false,
    });
  })

  onDestroy(() => {
    view.destroy()
  })
</script>

<div id="prosemirror" />
