defmodule Day5Test do
  use ExUnit.Case
  doctest Day5

  test "Part1.doit" do
    assert Day5.Part1.doit("test/day5_part1.data") == 5
  end
  test "Part2.doit" do
    assert Day5.Part2.doit("test/day5_part1.data") == 10
  end
end
