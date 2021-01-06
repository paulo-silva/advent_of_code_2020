# AdventOfCode

**Advent of Code 2020 w/ Elixir 💧**

<details>
  <summary>First Week</summary>

## [Day One](https://adventofcode.com/2020/day/1)
**TL;DR: Given a collection of numbers, you need to find the ones that sum 2020 and return the multiply result of them**

**Running**

```elixir
  iex> alias AdventOfCode.DayOne
  iex> sum_numbers = DayOne.exercise_input() |> DayOne.find_sum_numbers() # [1162, 858]
  iex> DayOne.multiply(sum_numbers) # => 996996
```

## [Day Two](https://adventofcode.com/2020/day/2)
**TL;DR: Given a collection of password, you need to find the ones that are valid by checking that only one of the provided position contains the given letter**

**Running**

```elixir
  iex> alias AdventOfCode.DayTwo
  iex> DayTwo.exercise_input() |> DayTwo.count_valid_password() # => 342
```

## [Day Three](https://adventofcode.com/2020/day/3)

**TL;DR: Given a string map, where `.` means squares and `#` means trees you need walk following the provided slope and count the trees you found in the path.**

**Running**

```elixir
  iex> alias AdventOfCode.DayThree
  iex> input = DayThree.exercise_input()
  iex> DayThree.slopes() |>
  iex> Enum.map(&DayThree.count_found_trees(input, &1)) |>
  iex> Enum.reduce(&Kernel.*/2) # => 2698900776
```
</details>
