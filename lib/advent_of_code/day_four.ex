defmodule AdventOfCode.DayFour do
  @required_fields [
    "byr", # (Birth Year)
    "iyr", # (Issue Year)
    "eyr", # (Expiration Year)
    "hgt", # (Height)
    "hcl", # (Hair Color)
    "ecl", # (Eye Color)
    "pid", # (Passport ID)
  ]

  @optional_fields [
    "cid" # (Country ID)
  ]

  def exercise_input do
    File.cwd!()
    |> Kernel.<>("/lib/advent_of_code/inputs/day_four.input")
    |> File.read!()
    |> String.split("\n\n")
    |> Enum.map(&String.replace(&1, ["\n", " "], ";"))
  end

  def count_valid_passports(input) do
    input
    |> Enum.map(&extract_data_from_document/1)
    |> Enum.filter(&valid_passport?/1)
    |> Enum.count()
  end

  def valid_passport?(passport) do
    (@required_fields -- Map.keys(passport)) in [[], @optional_fields]
  end

  def extract_data_from_document(document) do
    document
    |> String.split(";")
    |> Enum.reduce(%{}, fn data, acc ->
      case String.split(data, ":") do
        [field, value] -> Map.put(acc, field, value)
        _ -> acc
      end
    end)
  end
end
