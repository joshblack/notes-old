## Hindley-Milner

> An algorithm for inferring value types based on use. It literally formalizes the intuition that a type can be deduced by the functionality it supports.

It looks through the body of a function and computes a constraint set based on how each value is used. Once it has the constraint set, the algorithm completes the type reconstruction by unifying the constraints.

