defmodule Day3Test do
  use ExUnit.Case
  doctest Day3

  test "Part1.checksum" do
    assert Day3.Part1.steps(1) == 0
    assert Day3.Part1.steps(12) == 3.0
    assert Day3.Part1.steps(23) == 2.0
    assert Day3.Part1.steps(1024) == 31.0
  end
end
