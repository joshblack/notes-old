# Lists

## Heads and Tails

We can use the pipe character, `|`, to say that what is on the left hand side is the head of the list, and what is on the right hand side is the tail of the list.

So:

```ex
[3] == [3 | []]
[2, 3] == [2 | [3 | []]]
[1, 2, 3] == [1 | [2 | [3 | []]]]
```

As a result, we can use pattern matching to both match position of elements, and also as a way to collect the head and the tail of a list.

```ex
[a, b, b] = [1, 2, 3]
[head | tail] = [1, 2, 3]
```
