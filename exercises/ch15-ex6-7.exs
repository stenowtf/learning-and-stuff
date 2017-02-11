# 10.6
# 10.7

defmodule Parallel do
  def pmap(collection, fun) do
    me = self()
    collection
    |> Enum.map(fn (elem) ->
         spawn_link fn -> (send me, {self(), fun.(elem)}) end
       end)
    |> Enum.map(fn (pid) ->
         receive do {^pid, result} -> result end
       end)
  end
end

IO.inspect Parallel.pmap 1..100, &(&1 * &1)
