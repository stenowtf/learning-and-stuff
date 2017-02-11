# 15.1
# Run this code on your machine. See if you get comparable results.

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

# $ elixir -r ch15-ex1-2.exs -e "Chain.run(10)"

# {6963, "Result is 10"}
# {8202, "Result is 100"}
# {17786, "Result is 1000"}
# {153255, "Result is 10000"}

# $ elixir --erl "+P 1000000" -r ch15-ex1-2.exs -e "Chain.run(400_000)"

# {5550471, "Result is 400000"}
# {15611937, "Result is 1000000"}

# 15.2
# Write a program that spawns two processes and then passes each a unique token (for example, “fred” and “betty”). Have them send the tokens back.
# – Is the order in which the replies are received deterministic in theory? In practice?
# – If either answer is no, how could you make it so?

defmodule Ping do
  def receiver do
    receive do
      {who, message} ->
        send who, {:ok, message}
    end
  end

  def sender do
    receive do
      {:ok, message} ->
        IO.puts message
        sender()
    end
  end
end

sender = spawn(Ping, :sender, [])
first_receiver = spawn(Ping, :receiver, [])
second_receiver = spawn(Ping, :receiver, [])

send first_receiver, {sender, "ping"}
send second_receiver, {sender, "pong"}
