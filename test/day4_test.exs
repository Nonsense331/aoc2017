defmodule Day4Test do
  use ExUnit.Case
  doctest Day4

  test "Part1.verify" do
    assert Day4.Part1.verify("aa bb cc dd ee") == true
    assert Day4.Part1.verify("aa bb cc dd aa") == false
    assert Day4.Part1.verify("aa bb cc dd aaa") == true
  end

  test "Part1.count_verify" do
    assert Day4.Part1.count_verify("test/day4_part1.data") == 2
  end

  test "Part2.verify" do
    assert Day4.Part2.verify("abcde fghij") == true
    assert Day4.Part2.verify("abcde xyz ecdab") == false
    assert Day4.Part2.verify("a ab abc abd abf abj") == true
    assert Day4.Part2.verify("iiii oiii ooii oooi oooo") == true
    assert Day4.Part2.verify("oiii ioii iioi iiio") == false
  end
end
