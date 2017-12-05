defmodule Day1Test do
  use ExUnit.Case
  doctest Day1

  test "first_captcha" do
    assert Day1.first_captcha(1122) == 3
    assert Day1.first_captcha(1111) == 4
    assert Day1.first_captcha(1234) == 0
    assert Day1.first_captcha(91212129) == 9
  end

  test "second_captcha" do
    assert Day1.second_captcha(1212) == 6
    assert Day1.second_captcha(1221) == 0
    assert Day1.second_captcha(123425) == 4
    assert Day1.second_captcha(123123) == 12
    assert Day1.second_captcha(12131415) == 4
  end
end
