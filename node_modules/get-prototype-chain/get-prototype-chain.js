module.exports = function getPrototypeChain(obj) {
  var chain = [obj];

  var prototype = obj;
  while (prototype = Object.getPrototypeOf(prototype)) {
    chain.push(prototype);
  }  
  return chain;
};
