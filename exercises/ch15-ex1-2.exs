defmodule Chain do
  def counter(next_pid) do
    receive do
      n ->
        send next_pid, n + 1
    end
  end

  def create_processes(n) do
    last = Enum.reduce 1..n, self(),
            fn (_, send_to) ->
              spawn(Chain, :counter, [send_to])
            end

    send last, 0

    receive do
      final_answer ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_processes, [n])
  end
end

# elixir -r ch15-ex1-2.exs -e "Chain.run(10)"

# {6963, "Result is 10"}
# {8202, "Result is 100"}
# {17786, "Result is 1000"}
# {153255, "Result is 10000"}

# elixir --erl "+P 1000000" -r ch15-ex1-2.exs -e "Chain.run(400_000)"

# {5550471, "Result is 400000"}
# {15611937, "Result is 1000000"}
