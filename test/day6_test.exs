defmodule Day6Test do
  use ExUnit.Case
  doctest Day6

  test "Part1.doit" do
    assert Day6.Part1.doit("0 2 7 0") == 5
    assert Day6.Part1.doit("4 10 4 1 8 4 9 14 5 1 14 15 0 15 3 5") == 12841
  end
  test "Part2.doit" do
    assert Day6.Part2.doit("0 2 7 0") == 4
    assert Day6.Part2.doit("4 10 4 1 8 4 9 14 5 1 14 15 0 15 3 5") == 8038
  end
end
