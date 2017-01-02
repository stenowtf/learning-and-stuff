defmodule Physics.Rocketry do
  import Converter
  import Calcs
  import Physics.Laws
  import Planets

  def escape_velocity(:moon), do: moon |> escape_velocity
  def escape_velocity(:mars), do: mars |> escape_velocity
  def escape_velocity(:earth), do: earth |> escape_velocity

  def escape_velocity(planet) when is_map(planet) do
    planet
      |> calculate_escape
      |> to_km
      |> to_nearest_tenth
  end

  defp calculate_escape(%{mass: mass, radius: radius}) do
    2 * newtons_gravitational_constant * mass / radius
      |> square_root
  end

end
