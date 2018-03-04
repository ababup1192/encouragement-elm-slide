require('./index.html');
require('./main.css');
require('./hldefault.css');

import hljs from 'highlight.js'

const Elm = require('./Main.elm');
const mountNode = document.getElementById('main');

const app = Elm.Main.embed(mountNode);

document.body.addEventListener( 'DOMSubtreeModified', _ => {
  [].slice.call( document.querySelectorAll( 'pre code' ) ).forEach( hljs.highlightBlock )
}, false )
