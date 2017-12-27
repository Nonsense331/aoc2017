defmodule Day6 do
  defmodule Part1 do
    def doit(string) do
      blocks = String.split(string, ~r/\s+/)
      |> Enum.map(fn(x) ->
        String.to_integer(x)
      end)

      distribute_times(blocks, %{}, 0)
    end

    def get_highest(list, tuple) when list == [], do: tuple
    def get_highest([{first, fi} | rest], {highest, hi}) when highest == nil or first > highest do
      get_highest(rest, {first, fi})
    end
    def get_highest([first | rest], highest) do
      get_highest(rest, highest)
    end

    def distribute(blocks, left, index, size) when left == 0, do: blocks
    def distribute(blocks, left, index, size) when index == size do
      distribute(blocks, left, 0, size)
    end
    def distribute(blocks, left, index, size) do
      blocks = List.replace_at(blocks, index, Enum.at(blocks, index) + 1)
      distribute(blocks, left-1, index+1, size)
    end

    def distribute_times(blocks, seen_before, count) do
      atom = String.to_atom(Enum.join(blocks, "|"))
      case Map.fetch(seen_before, atom) do
      :error ->
        count = count + 1
        seen_before = Map.put(seen_before, atom, 1)
        {highest, index} = Enum.with_index(blocks)
        |> Day6.Part1.get_highest({nil,nil})

        List.replace_at(blocks, index, 0)
        |> distribute(highest, index+1, length(blocks))
        |> distribute_times(seen_before, count)
      {:ok, _} ->
        count
      end
    end
  end

  defmodule Part2 do
    def doit(string) do
      blocks = String.split(string, ~r/\s+/)
      |> Enum.map(fn(x) ->
        String.to_integer(x)
      end)

      distribute_times(blocks, %{}, 0)
    end

    def distribute_times(blocks, seen_before, count) do
      atom = String.to_atom(Enum.join(blocks, "|"))
      case Map.fetch(seen_before, atom) do
      :error ->
        count = count + 1
        seen_before = Map.put(seen_before, atom, count)
        {highest, index} = Enum.with_index(blocks)
        |> Day6.Part1.get_highest({nil,nil})

        List.replace_at(blocks, index, 0)
        |> Day6.Part1.distribute(highest, index+1, length(blocks))
        |> distribute_times(seen_before, count)
      {:ok, position} ->
        count + 1 - position
      end
    end
  end
end
