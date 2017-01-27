# 6.6
# The most efficient way to find the number is to guess halfway between the low and high numbers of the range. If our guess is too big, then the answer lies between the bottom of the range and one less than our guess. If our guess is too small, then the answer lies between one more than our guess and the end of the range.
# Your API will be guess(actual, range), where range is an Elixir range.
# Your output should look similar to this:
#     iex> Chop.guess(273, 1..1000)
#     Is it 500
#     Is it 250
#     Is it 375
#     Is it 312
#     Is it 281
#     Is it 265
#     Is it 273
#     273
# Hints:
# – You may need to implement helper functions with an additional parameter (the currently guessed number).
# – The div(a,b) function performs integer division.
# – Guard clauses are your friends.
# – Patterns can match the low and high parts of a range (a..b=4..8).

defmodule Chop do
  def guess(actual, range) do
    guess(actual, range, half(range))
  end

  def guess(actual, _, number) when number == actual do
    IO.write "Is it #{number}?\n\n"
    IO.write "#{number}!\n\n"
  end

  def guess(actual, range, number) when number < actual do
    IO.write "Is it #{number}?\n"
    guess(actual, number..max(range), half(number..max(range)))
  end

  def guess(actual, range, number) when number > actual do
    IO.write "Is it #{number}?\n"
    guess(actual, min(range)..number, half(min(range)..number))
  end

  def min(a.._), do: a
  def max(_..b), do: b
  def half(a..b), do: a + (div((b - a), 2))
end

Chop.guess(273, 1..1000)
