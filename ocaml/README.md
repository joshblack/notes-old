# OCaml

## Lists

An important distinction for lists in OCaml is that you use semicolons to separate list elements in lists rather than commas. Commas are instead used for tuples.

Lists in OCaml are defined then using brackets and semicolons, like in `[1; 2; 3]`, where the brackets are just syntactic sugar for `::`. The `::` operator is right-associative, and is used for prepending the element on the left hand side onto the list on the right hand side, for example:

```ml
(* Prepend one element onto a list *)
# 1 :: 2 :: 3 :: [];;
- : int list = [1; 2; 3]

```
