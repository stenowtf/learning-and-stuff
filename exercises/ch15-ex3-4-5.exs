# 15.3
# Use spawn_link to start a process, and have that process send a message to the parent and then exit immediately. Meanwhile, sleep for 500 ms in the parent, then receive as many messages as are waiting. Trace what you receive. Does it matter that you weren’t waiting for the notification from the child when it exited?
# 15.4
# Do the same, but have the child raise an exception. What difference do you see in the tracing?
# 15.5
# Repeat the two, changing spawn_link to spawn_monitor.

defmodule Ping do
  def receiver(parent) do
    send parent, "here i am"
    exit :normal
    # raise "ops"
  end

  def get_messages do
    receive do
      message ->
        IO.puts "got #{inspect message}"
      after 500 ->
        IO.puts "no more things to do"
        exit :ok
    end
    get_messages()
  end

  def run do
    spawn_link(Ping, :receiver, [self()])
    # spawn_monitor(Ping, :receiver, [self()])
    :timer.sleep(500)
    get_messages()
  end
end

Ping.run
