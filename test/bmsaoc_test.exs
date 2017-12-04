defmodule BATest do
  use ExUnit.Case
  doctest BA

  test "greets the world" do
    assert BA.hello() == :world
  end

  test "first_captcha" do
    assert BA.first_captcha(1122) == 3
    assert BA.first_captcha(1111) == 4
    assert BA.first_captcha(1234) == 0
    assert BA.first_captcha(91212129) == 9
  end

  test "second_captcha" do
    assert BA.second_captcha(1212) == 6
    assert BA.second_captcha(1221) == 0
    assert BA.second_captcha(123425) == 4
    assert BA.second_captcha(123123) == 12
    assert BA.second_captcha(12131415) == 4
  end
end
