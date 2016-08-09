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
