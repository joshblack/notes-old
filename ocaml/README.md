# OCaml

## Tuples

Tuples are ordered collectinos of values that can each be of a different type. You create tuples by separating values by a comma. For example:

```ml
# let some_tuple = (404, "Not Found");;
val some_tuple : int * string
```

We can see the `*` character in the type signature, which represents the Cartesian product of the set of elements of type `t` and the set of elements of type `s`.

For the mathematically inclined, the Cartesian Product, A x B, is a set defined as:

```
A x B = { (a, b) | a ∈ A and b ∈ B }
```

### Pattern Matching

Tuples are a great opportunity to leverage pattern-matching, for example:

```ml
# let (code, message) = some_tuple;;
val code : int = 404
val message : string = "Not Found"
```

## Lists

An important distinction for lists in OCaml is that you use semicolons to separate list elements in lists rather than commas. Commas are instead used for tuples.

Lists in OCaml are defined then using brackets and semicolons, like in `[1; 2; 3]`, where the brackets are just syntactic sugar for `::`. The `::` operator is right-associative, and is used for prepending the element on the left hand side onto the list on the right hand side, for example:

```ml
(* Prepend one element onto a list *)
# 1 :: 2 :: 3 :: [];;
- : int list = [1; 2; 3]
```

We can also use the `::` operator to pattern-match and grab the head and tail of a list.

```ml
let my_favorite_language languages =
  match languages with
  | head :: tail -> head
  | [] -> "OCaml"
```

## Functions

### Recursive Functions

We can specify that a function is recursive with the `rec` keyword.

```ml
let rec sum list =
  match list with
  | [] -> 0
  | head :: tail -> head + sum tail
```

As another example, we could have multiple match statements for a function that could remove sequential duplicates.

```ml
let rec dedupe list =
  match list with
  | [] -> []
  | [hd] -> [hd]
  | hd1 :: hd2 :: tl ->
    if hd1 == hd2 then dedupe (hd2 :: tl)
    else hd1 :: dedupe (hd2 :: tl)
```

## Options

An option is used to express a value that might or might not be present.

```ml
let divide x y =
  if y = 0 then None else Some (x/y);;
```

Where `None` and `Some` are constructors that let you build optional values. Options can be thought of as specialized lists that can only have zero or one elements.

## Records & Variants

OCaml allows us to define new data types with the `type` keyword. Imagine we wanted to represent a single point in a 2d plane:

```ml
type point = { x : float; y : float };;
```

In this case, `point` is a `Record` type and can be defined by doing the following:

```ml
let p = { x = 3.; y = -4. };;
```

And we access the contents of the record by using pattern matching

```ml
let magnitude { x = x_pos; y = y_pos } =
  sqrt (x_pos ** 2. +. y_pos ** 2.);;
```

This format also has a shorthand, called field punning, where we could just instead write:

```ml
let magnitude { x; y } = sqrt (x ** 2. +. y ** 2.);;
```

## Variant Type

If we had a case where we wanted to create a union of types, we would use a variant type.

```ml
type log = { message: string; timestamp: int };;
type action = { name: string; occurences: int };;

type metric =
  | Log of log
  | Action of action
```
