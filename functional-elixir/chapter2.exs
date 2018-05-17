# cost = 10 * 0.10 + 3 * 2 + 1 * 15

# distance_km = 200
# time_h = 4
# average_velocity_km_h = IO.puts(distance_km / time_h)

# apply_tax = fn price ->
#   new_price = :erlang.float_to_binary(price * 1.12, decimals: 2)
#   tax = :erlang.float_to_binary(price * 0.12, decimals: 2)

#   IO.puts("Price: #{new_price} - Tax: #{tax}")
# end

# Enum.each([12.5, 30.99, 250.49, 18.80], apply_tax)

defmodule MatchstickFactory do
  @big 50
  @medium 20
  @small 5

  def boxes(matchsticks) do
    big = div(matchsticks, @big)
    matchsticks = rem(matchsticks, @big)

    medium = div(matchsticks, @medium)
    matchsticks = rem(matchsticks, @medium)

    small = div(matchsticks, @small)
    matchsticks = rem(matchsticks, @small)

    %{big: big, medium: medium, remaining_matchsticks: matchsticks, small: small}
  end
end
