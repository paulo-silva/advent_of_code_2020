defmodule AdventOfCode.DayThree do
  @square "."
  @tree "#"
  @slopes [
    {1, 1},
    {3, 1},
    {5, 1},
    {7, 1},
    {1, 2}
  ]

  def slopes, do: @slopes

  def exercise_input do
    File.cwd!()
    |> Kernel.<>("/lib/advent_of_code/inputs/day_three.input")
    |> File.read!()
    |> String.split("\n")
    |> Enum.reject(&(String.length(&1) == 0))
  end

  def count_found_trees(input, slope) do
    walk(input, 0, 0, 0, slope)
  end

  defp walk(input, 0, 0, 0, {downs, rows} = slope), do: walk(input, rows, downs, 0, slope)

  defp walk(input, cur_row, cur_pos, trees, {downs, rows} = slope) do
    case Enum.at(input, cur_row) do
      nil ->
        trees

      row ->
        case String.at(row, cur_pos) do
          # When the current position extrapolate row length
          nil ->
            new_pos = rem(cur_pos, String.length(row))
            walk(input, cur_row, new_pos, trees, slope)

          @tree ->
            walk(input, cur_row + rows, cur_pos + downs, trees + 1, slope)

          @square ->
            walk(input, cur_row + rows, cur_pos + downs, trees, slope)
        end
    end
  end
end
