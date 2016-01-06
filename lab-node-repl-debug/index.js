var deasync = require('deasync');
var repl = require('repl');

function startRepl(context) {
  var done = false;
  var started = repl.start({
    prompt: 'repl> ',
    input: process.stdin,
    output: process.stdout,
    replMode: repl.REPL_MODE_MAGIC
  }).on('exit', function() {
    done = true;
  });
  for (var key in context) {
    started.context[key] = context[key];
  }

  deasync.loopWhile(function() { return !done; });
}

function main() {
  var test = 100;
  startRepl({test: test});
}

main();

