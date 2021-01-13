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
    |> String.split("\n\n", trim: true)
    |> Enum.map(&String.replace(&1, ["\n", " "], ";"))
  end

  def count_valid_passports(input) do
    input
    |> Enum.map(&extract_data_from_document/1)
    |> Enum.filter(&valid_passport?/1)
    |> Enum.count()
  end

  defp valid_passport?(passport) do
    case @required_fields -- Map.keys(passport) do
      rem when rem in [[], @optional_fields] ->
        Enum.all?(passport, fn {field, value} -> validation(field, value) end)
      _ ->
        false
    end
  end

  defp extract_data_from_document(document) do
    document
    |> String.split(";")
    |> Enum.reduce(%{}, fn data, acc ->
      case String.split(data, ":") do
        [field, value] -> Map.put(acc, field, value)
        _ -> acc
      end
    end)
  end

  # (Country ID - optional)
  defp validation("cid", _value), do: true

  defp validation(field, value) do
    validations = %{
      "byr" => &(String.to_integer(&1) in 1920..2002), # (Birth Year)
      "iyr" => &(String.to_integer(&1) in 2010..2020), # (Issue Year)
      "eyr" => &(String.to_integer(&1) in 2020..2030), # (Expiration Year)
      "hgt" => fn (height) ->
        case Integer.parse(height) do
          {h, "cm"} -> h in 150..193
          {h, "in"} -> h in 59..76
          _ -> false
        end
      end, # (Height)
      "hcl" => &(Regex.match?(~r/#[0-9|a-f]{6}/, &1)), # (Hair Color)
      "ecl" => &(&1 in ~w[amb blu brn gry grn hzl oth]), # (Eye Color)
      "pid" => &(Regex.match?(~r/[0-9]{9}/, &1)), # (Passport ID)
    }

    validations[field].(value)
  end
end
