<script>
  import { onMount, onDestroy } from 'svelte';
  import { EditorView } from 'prosemirror-view';
  import { state } from 'prosemirror/state';
  import '!style-loader!css-loader!prosemirror-view/style/prosemirror.css';

  export let doc;
  $: {
    doc = JSON.stringify(editorState.toJSON());
  }

  let editorState = state;

  const jsonDoc = JSON.parse(doc);
  editorState.doc = editorState.schema.nodeFromJSON(jsonDoc.doc);

  onMount(() => {
    let view = new EditorView(document.getElementById('prosemirror'), {
      state: editorState,
      dispatchTransaction: (transaction) => {
        const state = view.state.apply(transaction)
        editorState = state;
        view.updateState(state);
      },
    });
  })

  onDestroy(() => {
    view.destroy()
  })
</script>

<div id="prosemirror" class="document__body" />

<input type="hidden" name="document[content]" value="{doc}">
