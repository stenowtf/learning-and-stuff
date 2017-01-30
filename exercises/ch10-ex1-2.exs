defmodule MyEnum do
  # 10.1
  # Implement the following Enum functions using no library functions or list comprehensions: all?, each, filter, split, and take. You may need to use an if statement to implement filter. The syntax for this is
  #
  # if condition do
  #   expression(s)
  # else
  #   expression(s)
  # end

  # all?
  # Returns true if the given fun evaluates to true on all of the items in the enumerable. It stops the iteration at the first invocation that returns false or nil.
  def my_all?(list, func), do: _my_all?(list, func, true)
  defp _my_all?([], _, all), do: all
  defp _my_all?([head | tail], func, all) when all == true do
    _my_all?(tail, func, func.(head))
  end
  defp _my_all?(_, func, all) when all == false do
    _my_all?([], func, false)
  end

  # each
  # Invokes the given fun for each item in the enumerable. Returns :ok.
  def my_each([], _), do: :ok
  def my_each([head | tail], func) do
    func.(head)
    my_each(tail, func)
  end

  # filter
  # Filters the enumerable, i.e. returns only those elements for which fun returns a truthy value.
  def my_filter(list, func), do: _my_filter(list, func, [])
  defp _my_filter([], _, result_list), do: Enum.reverse(result_list)
  defp _my_filter([head | tail], func, result_list) do
    new_result_list = if func.(head) do
                        [head | result_list]
                      else
                        result_list
                      end
    _my_filter(tail, func, new_result_list)
  end

  # split
  # Splits the enumerable into two enumerables, leaving count elements in the first one.
  def my_split(list, num), do: _my_split(list, num, 0, {[], list})
  defp _my_split([], num, done, {result_list, left_list}) do
    {Enum.reverse(result_list), left_list}
  end
  defp _my_split(_, 0, 0, {result_list, left_list}) do
    {result_list, left_list}
  end
  defp _my_split([head | tail], num, done, {result_list, left_list})
  when done < num do
    _my_split(tail, num, done + 1, {[head | result_list], List.delete(left_list, head)})
  end
  defp _my_split([head | tail], num, done, {result_list, left_list})
  when done >= num do
    _my_split(tail, num, done + 1, {result_list, left_list})
  end

  # take
  # Takes the first count items from the enumerable.

end

# 10.2
# (Hard) Write a flatten(list) function that takes a list that may contain any num of sublists, which themselves may contain sublists, to any depth. It returns the elements of these lists as a flat list.
#
# iex> MyList.flatten([ 1, [ 2, 3, [4] ], 5, [[[6]]]]) [1,2,3,4,5,6]
#
# Hint: You may have to use Enum.reverse to get your result in the correct order.

IO.inspect MyEnum.my_all?([2, 4, 6], fn(x) -> rem(x, 2) == 0 end) # true
IO.inspect MyEnum.my_all?([2, 3, 4], fn(x) -> rem(x, 2) == 0 end) # false

IO.inspect MyEnum.my_each(["some", "example"], fn(x) -> IO.puts x end)

IO.inspect MyEnum.my_filter([1, 2, 3], fn(x) -> rem(x, 2) == 0 end)    # [2]
IO.inspect MyEnum.my_filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end) # [2, 4]

IO.inspect MyEnum.my_split([1, 2, 3], 2)  # {[1, 2], [3]}
IO.inspect MyEnum.my_split([1, 2, 3], 10) # {[1, 2, 3], []}
IO.inspect MyEnum.my_split([1, 2, 3], 0)  # {[], [1, 2, 3]}


