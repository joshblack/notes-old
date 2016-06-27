# The `Enum` module is one of the most used libraries in Elixir
list = Enum.to_list 1..5

Enum.concat([1, 2, 3], [4, 5, 6])

doubled = Enum.map(list, &(&1 * 2))

Enum.at(list, 3) # 4
Enum.at(list, 5) # nil

require Integer
Enum.filter(list, &(&1 > 2))

Enum.filter(list, &Integer.is_even/1)
Enum.reject(list, &Integer.is_even/1)

Enum.sort [3, 4, 5, 1, 2]
Enum.sort(list, &(&1 >= &2))


Enum.take(1..5, 3)
Enum.take_every(1..5, 2)
Enum.take_while(1..5, &(&1 < 4))
Enum.split(1..5, 3)

Enum.join(1..5)
Enum.join(1..5, ', ')

Enum.all?
Enum.any?
Enum.member?
Enum.empty?

Enump.szip
