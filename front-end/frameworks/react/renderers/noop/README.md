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

`ReactNoop` is what the module exports by default, and provides a way for core contribuotrs to render a Tree of Components without having to use a Host implementation (like the DOM).

Internally, the module leverages two maps for keeping track of `rootContainers` and `roots`.

- `ReactNoop#getChildren(rootID: string)`: Accesses the `rootContainers` map for the given `rootID` and returns it's children if the container exists. Otherwise, return null.
- `ReactNoop#render(element: ReactElement<any>, callback: ?Function)`: Shortcut for testing a single root, basically is a proxy call to `ReactNoop#renderToRootWithID` passing in the given element, and a `DEFAULT_ROOT_ID` constant defined internally.
- `ReactNoop#renderToRootWithID(element: ReactElement<any>, rootID: string, callback: ?Function)`: Tries to retrieve the `root` value for the given `rootID` in the `roots` Map. We then branch to the following conditions:
  - If there is no root:
    - Create a `container` with the shape: `type Container = {| rootID: string, children: Array |}`
    - Set the key `rootID` with the value `container` in the `rootContainers` Map
    - Create the `root` by calling to `NoopRenderer#createContainer` by passing in the new `container`
    - Update the `roots` Map by adding the given `rootID` key with value `root`
  - Call `NoopRenderer#updateContainer` with the given `element`, the existing `root`, `null`, and the optional `callback`.
- `ReactNoop#unmountRootWithID(rootID: string)`: Find the given `root` by looking up the value in the `roots` Map. If there is a root, call `NoopRenderer#updateContainer` to set it's value to null, and in the callback remove the node from the `roots` and `rootContainers` Maps.

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
