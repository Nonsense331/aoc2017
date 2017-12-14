defmodule Day5 do
  defmodule Part1 do
    def doit(filepath) do
      {:ok, data} = File.read(filepath)
      lines = String.split(data, "\n")
      lines = convert_to_int(lines, [])
      max = length(lines) - 1
      jump(lines, 0, max, 0)
    end

    def convert_to_int([first | rest], list) when first == "" or first == nil, do: list
    def convert_to_int([first | rest], list) do
      convert_to_int(rest, list ++ [String.to_integer(first)])
    end

    def jump(lines, index, max, steps) when index > max, do: steps
    def jump(lines, index, max, steps) when index < 0, do: steps
    def jump(lines, index, max, steps) do
      number = Enum.at(lines, index)
      jump(List.replace_at(lines, index, number + 1), index + number, max, steps + 1)
    end
  end

  defmodule Part2 do
    def doit(filepath) do
      {:ok, data} = File.read(filepath)
      lines = String.split(data, "\n")
      lines = convert_to_int(lines, [])
      max = length(lines) - 1
      jump(lines, 0, max, 0)
    end

    def convert_to_int([first | rest], list) when first == "" or first == nil, do: list
    def convert_to_int([first | rest], list) do
      convert_to_int(rest, list ++ [String.to_integer(first)])
    end

    def jump(lines, index, max, steps) when index > max, do: steps
    def jump(lines, index, max, steps) when index < 0, do: steps
    def jump(lines, index, max, steps) do
      number = Enum.at(lines, index)
      jump(List.replace_at(lines, index, offset(number)), index + number, max, steps + 1)
    end

    def offset(number) when number > 2 do
      number - 1
    end
    def offset(number) do
      number + 1
    end
  end
end
