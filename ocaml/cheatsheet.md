## String

### Length

```ml
String.length "Foo"
```

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
