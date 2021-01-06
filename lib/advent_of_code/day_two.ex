defmodule AdventOfCode.DayTwo do
  def exercise_input do
    File.cwd!()
    |> Kernel.<>("/lib/advent_of_code/inputs/day_two.input")
    |> File.read!()
    |> String.split("\n")
    |> Enum.reject(&(String.length(&1) == 0))
    |> Enum.map(&format_input/1)
  end

  def count_valid_password([%{range: _, letter: _, password: _} | _] = input) do
    input
    |> Enum.filter(&valid_password?/1)
    |> Enum.count()
  end

  defp format_input(input) do
    [range, letter, password] = String.split(input, " ")

    range = String.split(range, "-") |> Enum.map(&String.to_integer/1)
    letter = String.replace(letter, ":", "")

    %{
      range: Enum.at(range, 0)..Enum.at(range, 1),
      letter: letter,
      password: password
    }
  end

  defp valid_password?(%{range: r, letter: l, password: p}) do
    [pos_1, pos_2] = [Enum.at(r, 0) - 1, Enum.at(r, -1) - 1]

    case [String.at(p, pos_1), String.at(p, pos_2)] do
      # Letter should not be in both positions
      [^l, ^l] ->
        false

      # Letter can appear in the first or in the second position
      [^l, _] ->
        true

      [_, ^l] ->
        true

      # No conditions sastified, return false
      _ ->
        false
    end
  end
end
