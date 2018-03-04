require('./index.html');
require('./main.css');
require('./hldefault.css');

import hljs from 'highlight.js'
import {
  highlight
} from './highlight-ports.js';

const Elm = require('./Main.elm');
const mountNode = document.getElementById('main');

const app = Elm.Main.embed(mountNode);

app.ports.highlight.subscribe(highlight)