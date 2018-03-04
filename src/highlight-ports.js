import hljs from 'highlight.js'

export function highlight() {
  console.log("highlight!");
  setTimeout(() => 
    [].slice.call(document.querySelectorAll('pre code')).forEach(hljs.highlightBlock), 
    0
  );
}