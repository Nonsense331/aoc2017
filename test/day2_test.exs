defmodule Day2Test do
  use ExUnit.Case
  doctest Day2

  test "Part1.checksum" do
    assert Day2.Part1.checksum("test/day2_part1.data") == 18
  end

  test "Part2.checksum" do
    assert Day2.Part2.checksum("test/day2_part2.data") == 9
  end
end
