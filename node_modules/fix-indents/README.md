![Logo](https://content.screencast.com/users/a.stegno/folders/Jing/media/6f2364b6-707d-4645-855c-991abdac0042/00000113.png)

Fix Indents in Indented Languages like SASS, Pug, CoffeeScript, LiveScript, Haskell, Ocaml, F#, Python, Bash, etc.

## Demo

![Demo](https://mir-s3-cdn-cf.behance.net/project_modules/disp/04d28e48574753.589b99afb0f6c.gif)

###Other Examples

![Example](https://content.screencast.com/users/a.stegno/folders/Jing/media/c4b5c81d-de94-45cf-be2a-85039d3cdaac/00000110.png)


![SASS Example](https://content.screencast.com/users/a.stegno/folders/Jing/media/d6bd983c-bf5b-46a2-b78f-677fea5ef295/00000111.png)
###Motivation

* Developer puts different amount of indents during development. This tools allows to refactor indents into one consistent and accurate indented style.
* Sometimes Developer need to add top level block. It forces to move all nested tree.
* SASS will throw the error for inconsistent indents

### Install

```sh
#Install Nodejs
npm install fix-indents -g
```

### Use in Command Line
```sh

fix-indents ./style.sass

```

### Use with NodeJs
```Javascript

fixIndents = require("fix-indents");

fixedCode = fixIndents("PUT CODE HERE", { /*options*/ });

console.log(fixedCode);

```

### Options

Option | Description
---  | ---
countSpaces | Prefered amount of spaces for formatting
ignoreInside | Ignore multiline comment and multiline strings


Example for LiveScript:

```JSON
{ 
  
  "countSpaces": 2,
  "ignoreInside": [
     ["'''", "'''"],
     ["/*" , "*/" ],
     ["\"\"\"", "\"\"\""]
  ]
```