#!/usr/bin/env node
require! {
  \commander
  \chalk : { green, yellow }
  \./compile.js
  \./package.json : pack
}

opt = yellow(' Optional')

commander
  .version(pack.version)
  .option('-j, --jsify [filename]', 'Main File. Without extension')
  .option('-c, --compile [filename]', 'Main File. Without extension')
  .option('-p, --putinhtml [filename]', 'Put bundle.js and bundle.css content into html file' + opt)
  .option('-s, --sass [filename]', 'Result File (style.sass).' + opt)
  .option('-n, --nodestart [port]', 'Start nodejs to serve generated html files.' + opt)
  .option('-f, --fixindents', 'Fix indents in source files' + opt)
  .option('-m, --minify', 'Minify resulted css, javascript, html' + opt)
  .option('-k, --compilesass [filename]', 'Result File (style.css).' + opt)
  .option('-w, --watch', 'Watch changes in folder and recompile.' + opt)
  .option('-l, --livereload', 'Starts webserver and refreshes page when file changed (Not Implemented).' + opt)
  .option('-i, --ssr', 'Isomorphic Server side rendering. Generate .compiled/renderToString.ls' + opt)
  .option('-b, --bundle [filename]', 'Generate bundle.js' + opt)
  .option('-h, --html', 'Generate HTML included bundle.js for demo.' + opt)
  .option('-t, --template [filename]', 'Use custom html template for inline html' + opt)
  .parse(process.argv)

compile commander
  
