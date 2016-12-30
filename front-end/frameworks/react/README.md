# React (Fiber)

## Types

#### `ReactEmpty`

```js
type ReactEmpty: null | void | boolean;
```

#### `ReactText`

```js
type ReactText: string | number
```

#### `ReactNodeList`

```js
type ReactNodeList = ReactEmpty | ReactNode
```

#### `ReactFragment`

```js
type ReactFragment = ReactEmpty | Iterable<ReactNode
```

#### `ReactYield`

```js
type ReactYield = {
  $$typeof: Symbol | number,
  key: null | string,
  props: Object,
  continutation: mixed
}
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
  ReactFragment
```

## Resources

- [React Fiber Architecture](https://github.com/acdlite/react-fiber-architecture)
