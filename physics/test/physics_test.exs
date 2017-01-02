defmodule PhysicsTest do
  use ExUnit.Case
  doctest Physics

  test "escape velocity of earth is correct: 11.2" do
    ev = Physics.Rocketry.escape_velocity(:earth)
    assert ev == 11.2
  end

  test "escape velocity of the moon is correct: 2.4" do
    ev = Physics.Rocketry.escape_velocity(:moon)
    assert ev == 2.4
  end

  test "escape velocity of mars is correct: 5.1" do
    ev = Physics.Rocketry.escape_velocity(:mars)
    assert ev == 5.1
  end

  test "escape velocity of planet X is correct: 1.0" do
    ev = %{mass: 4.0e22, radius: 6.21e6}
    |> Physics.Rocketry.escape_velocity
    assert ev = 1.0
  end
end
