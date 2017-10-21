# `redis`

## Up & Running

Using docker:

```bash
# Start a redis instance
docker run --name some-redis -d redis

# Link to it with `redis-cli`
docker run -it --link some-redis:redis --rm redis redis-cli -h redis -p 6379
```

## Operations (with `redis-cli`)

### Using `SET`

```bash
# Set a string value for key `mykey`
> set mykey somevalue
OK
> get mykey
"somevalue"
```

Notes:

- `SET` performs an assignment, so it will replace any existing value already stored for the key.

### Increment with `incr`

```bash
> set counter 100
OK
> incr counter
(integer) 101
> decr counter
(integer) 100
> incrby counter 5
(integer) 105
> decrby counter 5
(integer) 100
```

### Working with the key space

```bash
> set mykey hello
OK
> exists mykey
(integer) 1
> del mykey
(integer) 1
> exists mykey
(integer) 0
> del mykey
(integer) 0
```

### Working with lists

```bash
# Push to the "right" end of the array
# Return the length of the list
> rpush mylist A
(integer) 1
> rpush mylist B
(integer) 2
# Push to the "left" end of the array, i.e. append
> lpush mylist first
(integer) 3
# Get the elements from the beginning to the end
# of the list
> lrange mylist 0 -1
1) "first"
2) "A"
3) "B"
```

### Redis hashes

```bash
# Commands
hmset key field value [field value ...]
hget key field
hgetall key
```

```bash
# Examples
> hmset user:1000 username joshblack
OK
```

### Redis Sets

> Redis Sets are unordered collections of strings

```bash
# Commands
sadd key member [member ...]
smembers key
sismember key member
```
