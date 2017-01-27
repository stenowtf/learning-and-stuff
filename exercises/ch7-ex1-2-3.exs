defmodule MyList do

  # 7.1
  # Write a mapsum function that takes a list and a function. It applies the function to each element of the list and then sums the result, so
  # iex> MyList.mapsum [1, 2, 3], &(&1 * &1)
  # 14
  def mapsum(list, func), do: _mapsum(list, 0, func)
  defp _mapsum([], sum, _), do: sum
  defp _mapsum([head | tail], sum, func) do
    _mapsum(tail, sum + func.(head), func)
  end

  # 7.2
  # Write a max(list) that returns the element with the maximum value in the list. (This is slightly trickier than it sounds.)
  def max(list), do: _max(list, 0)
  defp _max([], value), do: value
  defp _max([head | tail], value) when head >= value do
    _max(tail, head)
  end
  defp _max([head | tail], value) when head < value do
    _max(tail, value)
  end

  # 7.3
  # An Elixir single-quoted string is actually a list of individual character codes. Write a caesar(list, n) function that adds n to each list element, wrapping if the addition results in a character greater than z.
  # iex> MyList.caesar('ryvkve', 13)
  # ?????? :)
  def caesar([], _), do: []
  def caesar([head | tail], n) when (head + n) <= ?z do # wtf '?'?
    [head + n | caesar(tail, n)]
  end
  def caesar([head | tail], n) do
    [head + n - 26 | caesar(tail, n)]
  end

end

IO.puts MyList.mapsum [1, 2, 3], &(&1 * &1)
IO.puts MyList.max [1, 2, 3]
IO.puts MyList.caesar('ryvkve', 13)
