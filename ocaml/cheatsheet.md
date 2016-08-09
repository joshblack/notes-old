| Method Name | Description | Example |
|-------------|-------|---------|
| `String.length` | Calculate the length of a string | `String.length "Foo";; (* 3 *)` |

## List

### Length

```ml
let languages = ["OCaml";"Perl";"C"];;
List.length languages
```

### Map

```ml
let languages = ["OCaml";"Perl";"C"];;
List.map languages ~f:String.length

(* Here, ~f is a labelled argument *)
List.map ~f:String.length languages
```
