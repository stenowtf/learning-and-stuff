# 10.3
# In the last exercise of Chapter 7, Lists and Recursion, on page 65, you wrote a span function. Use it and list comprehensions to return a list of the prime numbers from 2 to n.

defmodule L do
  def span(head, to) when head <= to do
    [head | span(head + 1, to)]
  end
  def span(_, _), do: []

  def prime_numbers_from_two_to(n) do
    numbers = span(2, n)
    not_primes = for x <- numbers, y <- numbers, x >= y, x*y <= n, do: x*y
    numbers -- not_primes
  end
end

IO.inspect L.prime_numbers_from_two_to(10)

# 10.4
# The Pragmatic Bookshelf has offices in Texas (TX) and North Carolina (NC), so we have to charge sales tax on orders shipped to these states. The rates can be expressed as a keyword list.
#
# Write a function that takes both lists and returns a copy of the orders, but with an extra field, total_amount, which is the net plus sales tax. If a shipment is not to NC or TX, there’s no tax applied.

defmodule Taxes do

  def calc(orders, tax_rates) do
    for order <- orders do
      tax_rate = Keyword.get(tax_rates, order[:ship_to], 0)
      print(order, tax_rate)
    end
  end

  def print(order, tax_rate) when tax_rate > 0 do
    net = order[:net_amount]
    taxes = net * tax_rate
    order ++ [total_amount: net + taxes]
  end

  def print(order, 0), do: order

end

tax_rates = [ NC: 0.075, TX: 0.08 ]

orders = [
  [ id: 123, ship_to: :NC, net_amount: 100.00 ],
  [ id: 124, ship_to: :OK, net_amount:  35.50 ],
  [ id: 125, ship_to: :TX, net_amount:  24.00 ],
  [ id: 126, ship_to: :TX, net_amount:  44.80 ],
  [ id: 127, ship_to: :NC, net_amount:  25.00 ],
  [ id: 128, ship_to: :MA, net_amount:  10.00 ],
  [ id: 129, ship_to: :CA, net_amount: 102.00 ],
  [ id: 130, ship_to: :NC, net_amount:  50.00 ] ]

IO.inspect Taxes.calc(orders, tax_rates)
