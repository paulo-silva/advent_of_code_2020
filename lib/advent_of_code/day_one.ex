defmodule AdventOfCode.DayOne do
  alias AdventOfCode.Utils

  @sum_result 2020

  def exercise_input do
    File.cwd!()
    |> Kernel.<>("/lib/advent_of_code/inputs/day_one.input")
    |> File.read!()
    |> String.split("\n")
    |> Enum.reject(&(String.length(&1) == 0))
    |> Enum.map(&String.to_integer/1)
  end

  @spec find_sum_numbers(List.t(), Integer.t()) :: any()
  def find_sum_numbers(input, len) do
    permutations = Utils.permutations(input, len)

    Enum.find(permutations, &(Enum.sum(&1) == @sum_result))
  end

  def multiply(numbers) do
    Enum.reduce(numbers, &Kernel.*/2)
  end
end
