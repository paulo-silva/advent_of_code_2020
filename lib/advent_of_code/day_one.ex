defmodule AdventOfCode.DayOne do
  @sum_result 2020

  def exercise_input do
    File.cwd!()
    |> Kernel.<>("/lib/advent_of_code/inputs/day_one.txt")
    |> File.read!()
    |> String.split("\n")
    |> Enum.reject(&(String.length(&1) == 0))
    |> Enum.map(&String.to_integer/1)
  end

  def find_sum_numbers(input) do
    last_index = length(input) - 1

    do_find_sum_numbers(0, input, last_index)
  end

  def multiply(numbers) do
    Enum.reduce(numbers, &Kernel.*/2)
  end

  defp do_find_sum_numbers(cur_index, _, last_index) when cur_index > last_index, do: nil

  defp do_find_sum_numbers(cur_index, numbers, last_index) do
    number = Enum.at(numbers, cur_index)
    result = check_if_sums(number, numbers)

    case result do
      nil ->
        do_find_sum_numbers(cur_index + 1, numbers, last_index)

      found ->
        found
    end
  end

  defp check_if_sums(number, [head | _tail]) when number + head == @sum_result, do: [number, head]
  defp check_if_sums(number, [_ | tail]), do: check_if_sums(number, tail)
  defp check_if_sums(_number, []), do: nil
end
