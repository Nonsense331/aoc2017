defmodule Day2 do
  defmodule Part1 do
    def checksum(filepath) do
      {:ok, data} = File.read(filepath)
      data
      |> String.split("\n")
      |> calculate(0)
    end

    def calculate([line | rest], sum) when line == "" do
      sum
    end
    def calculate([line | rest], sum) do
      num = String.split(line, ~r/\s+/)
      |> to_integer([])
      |> diff(nil, nil)
      calculate(rest, sum + num)
    end

    def to_integer(empty, list) when empty == [], do: list
    def to_integer([char | rest], list) do
      to_integer(rest, [String.to_integer(char) | list])
    end

    def diff(list, high, low) when list == [] do
      high - low
    end
    def diff([char | rest], high, low) when high == nil do
      diff(rest, char, char)
    end
    def diff([char | rest], high, low) when char >= high do
      diff(rest, char, low)
    end
    def diff([char | rest], high, low) when char <= low do
      diff(rest, high, char)
    end
    def diff([char | rest], high, low) do
      diff(rest, high, low)
    end
  end

  defmodule Part2 do
    def checksum(filepath) do
      {:ok, data} = File.read(filepath)
      data
      |> String.split("\n")
      |> calculate(0)
    end

    def calculate([first_line | rest], sum) when first_line == "", do: sum
    def calculate([first_line | rest], sum) do
      number_list = String.split(first_line, ~r/\s+/)
      calculate(rest, sum + diff(number_list, 0))
    end

    def diff(list, result) when result > 0, do: result
    def diff([number | rest], result) do
      result = compare(number, rest, 0)
      diff(rest, result)
    end

    def compare(first, list, total) when total > 0, do: total
    def compare(first, list, total) when list == [], do: 0
    def compare(first, [second | rest], total) do
      total = divide(String.to_integer(first), String.to_integer(second))
      compare(first, rest, total)
    end

    def divide(first, second) when rem(first, second) == 0, do: div(first, second)
    def divide(first, second) when rem(second, first) == 0, do: div(second, first)
    def divide(first, second), do: 0
  end
end
