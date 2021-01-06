# AdventOfCode

**Advent of Code 2020 w/ Elixir 💧**

<details>
  <summary>First Week</summary>

## Day One
**TL;DR: Given a collection of numbers, you need to find the ones that sum 2020 and return the multiply result of them**

**Running**

```elixir
  iex> alias AdventOfCode.DayOne
  iex> sum_numbers = DayOne.exercise_input() |> DayOne.find_sum_numbers() # [1162, 858]
  iex> DayOne.multiply(sum_numbers) # 996996
```

## Day Two
**TL;DR: Given a collection of password, you need to find the ones that are valid by checking that only one of the provided position contains the given letter**

**Running**

```elixir
  iex> alias AdventOfCode.DayTwo
  iex> DayTwo.exercise_input() |> DayTwo.count_valid_password() # 342
```
</details>
