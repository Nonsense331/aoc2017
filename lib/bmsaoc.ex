defmodule BA do
  @moduledoc """
  Documentation for BA.
  """

  @doc """
  Hello world.

  ## Examples

      iex> BA.hello
      :world

  """
  def hello do
    :world
  end

  def first_captcha(input) do
    string = to_string input
    list = String.codepoints(string)
    add_captcha(list, 0, 0, Enum.count(list) - 1, 1)
  end

  def second_captcha(input) do
    string = to_string input
    list = String.codepoints(string)
    add_captcha(list, 0, 0, Enum.count(list) - 1, div(Enum.count(list), 2))
  end

  def add_captcha(list, sum, index, count, step) when index <= count do
    current = String.to_integer(Enum.at(list, index))
    next = String.to_integer(Enum.at(list, next_step(index, step, count)))
    add_captcha(list, sum + same(current, next), index + 1, count, step)
  end
  def add_captcha(list, sum, index, count, step), do: sum

  defp next_step(index, step, count) when index + step > count, do: index + step - count - 1
  defp next_step(index, step, count), do: index + step

  defp same(a, b) when a == b, do: b
  defp same(a, b), do: 0
end
