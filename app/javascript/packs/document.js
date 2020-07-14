import Document from '../document.svelte';

document.addEventListener('turbolinks:load', () => loadDocument());

function loadDocument() {
  const namespaceMenuButton = document.querySelector('.js__namespace-menu-btn');
  const namespaceMenu = document.querySelector('.js__namespace-menu');
  namespaceMenuButton.addEventListener('click', (event) => {
    namespaceMenu.classList.toggle('hidden');
  });

  const el = document.querySelector('#curaga-document');

  if (typeof el != 'undefined' && el != null) {
    const doc = el.dataset.doc;
    delete el.dataset.doc;

    const curagaDoc = new Document({
      target: el,
      hydrate: true,
      props: {
        doc,
      },
    });

    window.curagaDoc = curagaDoc;
  }
}
