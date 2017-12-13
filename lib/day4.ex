defmodule Day4 do
  defmodule Part1 do
    def count_verify(filepath) do
      {:ok, data} = File.read(filepath)
      lines = String.split(data, "\n")
      verify_line(lines, 0)
    end

    def verify_line([line | rest], sum) when rest == [], do: sum
    def verify_line([line | rest], sum) do
      verify_line(rest, verify_sum(verify(line), sum))
    end

    def verify_sum(valid, sum) when valid == true, do: sum + 1
    def verify_sum(valid, sum), do: sum

    def verify(string) when string == nil, do: false
    def verify(string) do
      list = String.split(string, " ")
      verify_list(list, true)
    end

    def verify_list([first | rest], valid) when rest == [], do: valid
    def verify_list(list, valid) when valid == false, do: valid
    def verify_list([first | rest], valid) do
      valid = !Enum.member?(rest, first)
      verify_list(rest, valid)
    end
  end

  defmodule Part2 do
    def count_verify(filepath) do
      {:ok, data} = File.read(filepath)
      lines = String.split(data, "\n")
      verify_line(lines, 0)
    end

    def verify_line([line | rest], sum) when rest == [], do: sum
    def verify_line([line | rest], sum) do
      verify_line(rest, verify_sum(verify(line), sum))
    end

    def verify_sum(valid, sum) when valid == true, do: sum + 1
    def verify_sum(valid, sum), do: sum

    def verify(string) when string == nil, do: false
    def verify(string) do
      list = String.split(string, " ")
      verify_list(list, true)
    end

    def verify_list([first | rest], valid) when rest == [], do: valid
    def verify_list(list, valid) when valid == false, do: valid
    def verify_list([first | rest], valid) do
      valid = verify_character_list(first, rest, true)
      verify_list(rest, valid)
    end

    def verify_character_list(string, [first | rest], valid) when valid == false, do: false
    def verify_character_list(string, list, valid) when list == [], do: valid
    def verify_character_list(string, [first | rest], valid) do
      invalid = (String.codepoints(string) -- String.codepoints(first) == []) && (String.codepoints(first) -- String.codepoints(string) == [])
      verify_character_list(string, rest, !invalid)
    end
  end
end
