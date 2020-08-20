'use strict';

const forEachProperty = require('for-each-property');

function forEachPropertyDeep(o, callback, { enumerability = 'enumerable', inherited = false, excludeBuiltInPropsOf = [Function, Object], excludeProps = ['prototype'], parent, state = {}, path = [], objectsInspected = new Map } = {}) {
    const forEachPropOptions = { enumerability, inherited, excludeBuiltInPropsOf, excludeProps };

    forEachProperty(o, (value, key) => {
        let currentPath = path.concat(key);

        callback(value, key, currentPath, o, state);

        if (value && (typeof(value) === 'function' || typeof(value) === 'object') && !objectsInspected.has(value)) {
            objectsInspected.set(value);
            forEachPropertyDeep(value, callback, { parent: o, path: currentPath, enumerability, inherited, state, excludeBuiltInPropsOf, excludeProps, objectsInspected });
        }

    }, forEachPropOptions);

    return state;
}

module.exports = forEachPropertyDeep;