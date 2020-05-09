import Document from '../document.svelte'

document.addEventListener('DOMContentLoaded', () => {
  const el = document.querySelector('#untitled-document');

  if(typeof(el) != 'undefined' && el != null) {
    const doc = el.dataset.doc;
    delete el.dataset.doc;

    const untitledDoc = new Document({
      target: el,
      hydrate: true,
      props: {
        doc,
      },
    });

    window.untitledDoc = untitledDoc;
  }
});
