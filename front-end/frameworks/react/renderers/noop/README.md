# Noop Renderer

> This is a renderer of React that doesn't have a render target output. It is useful to demonstrate the internals of the reconciler in isolation and for testing semantics of reconciliation separate from the host environment.

This file contains two major objects defined in this file, `NoopRenderer` and `ReactNoop`.

`ReactNoop` is the default export.

The important types defined in this module are:

```js
type Container = {
  rootID: string,
  children: Array<Instance | TextInstance>
};
```

```js
type Props = {
  prop: any
};
```

```js
type Instance = {|
  type: string,
  id: number,
  children: Array<Instance | TextInstance>,
  prop: any
|};
```

```js
type TextInstance = {|
  text: string,
  id: number
|};
```

_Note: If you're wondering what `{| |}` stands for, it corresponds to Flow's [exact object types](https://github.com/facebook/flow/releases/tag/v0.32.0)_

## `NoopRenderer`

`NoopRenderer` makes a call to [`ReactFiberReconclier`](https://github.com/joshblack/notes/blob/master/front-end/frameworks/react/renderers/shared/fiber/ReactFiberReconciler.md), which exposes a function that takes in a `HostConfig` type and returns a `Reconciler`.

## `ReactNoop`

## Module

This module imports the following modules:

```js
var ReactFiberReconciler = require('ReactFiberReconciler');
var ReactInstanceMap = require('ReactInstanceMap');
var {
  AnimationPriority
} = require('ReactPriorityLevel');
var emptyObject = require('emptyObject');
```

This module imports the following types:

```js
import type { Fiber } from 'ReactFiber';
import type { UpdateQueue } from 'ReactFiberUpdateQueue';
```

This module leverages the following local types:

```js
type Container = {
  rootID: string;
  children: Array<Instance | TextInstance>;
};
type Props = {
  prop: any
};
type Instance = {|
  type: string;
  id: number;
  children: Array<Instance | TextInstance>;
  prop: any;
|};
type TextInstance = {|
  text: string;
  id: number;
|};
```

Finally, this module exposes the following exports:

```js
ReactNoop
```
