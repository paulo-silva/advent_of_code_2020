defmodule AdventOfCode.Utils do
  def permutations(list), do: permutations(list, length(list))
  def permutations([], _), do: [[]]
  def permutations(_, 0), do: [[]]

  def permutations(list, i) do
    for x <- list, y <- permutations(list, i - 1), do: [x | y]
  end
end
