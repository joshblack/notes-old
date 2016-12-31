# React (Fiber)

This section contains as many notes as possible on React's new Fiber renderer. It looks to mirror the React project structure as closely as possible, replacing the files with `.md` extensions versus `.js`.

## History

### [Outline for new Reconciler Infrastructure](https://github.com/facebook/react/pull/6690)

_[Dan Abramov's Explanation for changes](https://github.com/facebook/react/pull/6690#issuecomment-217130167)_

Really interesting PR that introduceds the initial foundation for the new reconciler infrastructure. You can see that the types of work are a subset of what they become in the actual implementation:

```js
var TypesOfWork = {
  FunctionalComponent: 1,
  ClassComponent: 2,
  NativeComponent: 3,
};
```

There is an idea for a `StateNode` that is simply an object with a `next` field that could return another `StateNode`.

```js
type StateNode = {
  next: ?{ [key: string]: StateNode },
};

module.exports = function() : StateNode {
  return {
    next: null,
  };
};
```

There is the intorduction of the `ReactFiberReconciler` file, which exposes are first `HostConfig` and `Reconciler` types.

```js
export type HostConfig<T, P, I> = {
  createHostInstance(element : ReactHostElement<T, P>) : I,
  scheduleHighPriCallback(callback : () => void) : void,
  scheduleLowPriCallback(callback : (deadline : Deadline) => void) : void
};

export type Reconciler = {
  mountNewRoot(element : ReactElement) : OpaqueID;
};
```

It's cool to see the contract still being held where `ReactFiberReconciler` exports a function that takes in a `HostConfig` and returns a `Reconciler`.

There's also the introduction of `performUnitOfWork`, taking in a `Fiber` and possibly returning it (if the `tag` of the `fiber` is defined).

And, finally, there is the first look at the definition of a `Fiber`:

```js
export type Fiber = {
  tag: number,

  parent: ?Fiber,
  child: ?Fiber,
  sibling: ?Fiber,

  input: ?Object,
  output: ?Object,

  handler: EffectHandler,
  handlerTag: EffectTag,

  hasPendingChanges: bool,

  stateNode: StateNode,
};
```

### [Fiber Principles: Contributing to Fiber](https://github.com/facebook/react/issues/7942)

### [[Fiber] Umbrella for remaining features & bugs](https://github.com/facebook/react/issues/7925)

_[Dan Abramov explains how to help](https://github.com/facebook/react/issues/7925#issuecomment-259258900)_

## Types

#### `ReactEmpty`

```js
type ReactEmpty: null | void | boolean;
```

#### `ReactText`

```js
type ReactText: string | number;
```

#### `ReactNodeList`

```js
type ReactNodeList = ReactEmpty | ReactNode;
```

#### `ReactFragment`

```js
type ReactFragment = ReactEmpty | Iterable<ReactNode>;
```

#### `ReactYield`

```js
type ReactYield = {
  $$typeof: Symbol | number,
  key: null | string,
  props: Object,
  continutation: mixed
};
```

#### `ReactCoroutine`

```js
export type ReactCoroutine = {
  $$typeof: Symbol | number,
  key: null | string,
  children: any,
  // This should be a more specific CoroutineHandler
  handler: (props: any, yields: Array<ReifiedYield>) => ReactNodeList,
  props: any,
};
```

#### `ReactPortal`

```js
export type ReactPortal = {
  $$typeof: Symbol | number,
  key: null | string,
  containerInfo: any,
  children : ReactNodeList,
  implementation: any,
};
```

#### `ReactNode`

```js
type ReactNode =
  ReactElement<any> |
  ReactCoroutine |
  ReactYield |
  ReactPortal |
  ReactText |
  ReactFragment;
```

## Resources

- [React Fiber Architecture](https://github.com/acdlite/react-fiber-architecture)
