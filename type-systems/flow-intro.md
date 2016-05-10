## Flow Intro

```js
/**
 * Primitives: boolean, number, string, null, void
 * Also supports: any, mixed
 *
 * Optional object properties and optional function parameters
 * have the type T|void, for some type T.
 */

// Optional signature is keyName?
type optionalObject = {
  foo?: string
};

const valid: optionalObject = {
  foo: 'foo'
};

const undefinedButValid: optionalObject = {
  foo: undefined,
};

// null is not a string, nor void
// const nullAndInvalid: optionalObject = {
  // foo: null, 
// };

type Maybe<T> = T | void | null;

// Maybe types are foo: ?string
// const maybeFunction = (foo: Maybe<string>) => {
const maybeFunction = (foo: ?string) => {
  (foo: string | void | null);
};

maybeFunction('foo');
maybeFunction(undefined); // void
maybeFunction();
maybeFunction(null);


/**
 * Literal Types
 *
 * So we have booleans for admitting true and false, numbers for
 * any number, and string for any string. However, sometimes it
 * can be useful to specify types that admit a single value. For
 * this, we have something called a Literal Type.
 *
 * These can be used for enums, disjoint unions, and for overloading.
 */
// ("bar": "foo"); // Expected string literal `foo`, got `bar` instead

// type Nothing = void;
// type Maybe<T> = T | Nothing;

// In Type Thoery, the bottom type is the type that has no values. It is also
// called the zero, or empty, type and is sometimes denoted with falsum.

type Node<T> = {
  value: T | 'root';
  left?: Tree<T>;
  right?: Tree<T>;
};

// type Empty = null | void;
// type Maybe<T> = T | null | void;
// type Tree<T> = Empty | Node<T>;
type Tree<T> = ?Node<T>;

const t: Tree<number> = {
  value: 'root',
  left: {
    value: 1,
    left: {
      value: 3,
    },
  },
  right: {
    value: 2,
  },
};

// Defining module interfaces
// Importing external code

// Unbounded Polymorphism
// Bounded Polymorphism

// Not all values `obj: T` have a property `x`, let alone a property `x` that
// is a number given the additional requirement imposed by Math.abs();
// function unbounded<T>(obj: T): T {
  // console.log(Math.abs(obj.x));
  // return obj;
// };

// Allows us to have signatures and definitions to specify relationships
// between their type parameters, without having to sacrifice the benefits of
// generics
// function bounded<T: { x: number }>(obj: T): T {
  // console.log(Math.abs(obj.x));
  // return obj;
// }

// Disjoint Unions
// string and numbers supported
type BinaryTree =
  { kind: 'leaf', value: number } |
  { kind: 'branch', left: BinaryTree, right: BinaryTree, value: number };
```
