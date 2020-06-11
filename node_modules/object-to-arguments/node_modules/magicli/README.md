# MagiCLI

Automagically generates command-line interfaces (CLI), for any module.
Just `require('magicli')();` and your module is ready to be run via CLI.

The goal is to have any module prepared to be installed globally `-g` and to be run via CLI, with no efforts. Follow these 3 steps and you are done:

 * `npm install magicli --save`
 * Add the property `bin` to your package.json with the value `./bin/cli.js`
 * Create the file `./bin/cli.js` with the following content:

```javascript
#!/usr/bin/env node

require('magicli')();
```

**That's it!** Install your module with `-g` and run it with `--help`. In the same way you can just run `node ./bin/cli.js --help` to test it quickly, without install.

## How it works

Let's suppose that `your-module` exports the function:

```javascript
module.exports = function(param1, param2) {
    return param1 + param2;
}
```

When calling it via CLI, the program will be expecting the parameters names as options. It doesn't need to follow the same order as defined in the function. Example:

```bash
$ your-module --param2="K" --param1="Z"
```
It will work with any kind of function declaration, e.g.:
```javascript
// An Arrow function with Destructuring assignment and Default values
const fn = ([param1, [param2]] = ['z', ['k']], { param3 }) => {};
module.exports = fn;
```