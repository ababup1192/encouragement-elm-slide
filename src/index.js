require('./index.html');
require('./main.css');
require('./hldefault.css');

import hljs from 'highlight.js'

const Elm = require('./Main.elm');
const mountNode = document.getElementById('main');

const app = Elm.Main.embed(mountNode);

document.body.addEventListener('DOMSubtreeModified', e => {
  const elements = [].slice.call(document.querySelectorAll('pre code'))
  if (elements.indexOf(e.target) !== -1) return

  elements.forEach(hljs.highlightBlock)
}, false)