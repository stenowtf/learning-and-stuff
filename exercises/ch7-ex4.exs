# 7.4
# Write a function MyList.span(from, to) that returns a list of the numbers from from up to to.

defmodule MyList do
  def span(head, to) when head <= to do
    [head | span(head + 1, to)]
  end

  def span(_, _), do: []
end

IO.inspect MyList.span(5, 10)
