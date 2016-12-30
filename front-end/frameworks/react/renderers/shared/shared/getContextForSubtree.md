# `getContextForSubtree`

#### `getContextForSubtree = (parentComponent : ?ReactComponent<any, any, any>) => Object`

This seems like a utility for getting the context fiber for a given `parentComponent`. If we're at the Root Node, or just don't have a `parentComponent` then we'll just return an `emptyObject`.

Otherwise, we'll try and use `ReactInstanceMap` to lookup the instance for the `parentComponent`. If the instance has a `tag` of type `number`, then we'll use `getContextFiber` on the instance. Else, we use `instance._processChildContext(instance._context)`.

TODO:

- Document where `_processChildContext` comes from and how `instance._context` gets set

## Module

This module imports the following modules:

```js
const ReactInstanceMap = require('ReactInstanceMap');
const emptyObject = require('emptyObject');
const invariant = require('invariant');
```
Finally, this module exposes the following exports:

```js
getContextForSubtree
```
