defmodule Times do
  def double(n), do: n * 2

  # 6.1
  # Extend the Times module with a triple function that multiplies its parameter by three.
  def triple(n), do: n * 3

  # 6.2
  # Run the result in iex. Use both techniques to compile the file
  # $ iex ch6-ex1-2-3.exs
  # iex> c "ch6-ex1-2-3.exs"

  # 6.3
  # Add a quadruple function. (Maybe it could call the double function....)
  def quadruple(n), do: double(double(n))
end
