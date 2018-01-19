defmodule IslandsEngine.Island do
  alias IslandsEngine.{Coordinate, Island}

  @enforce_keys [:coordinates, :hit_coordinates]

  defstruct [:coordinates, :hit_coordinates]

  # def new() do
  #   %Island{coordinates: MapSet.new(), hit_coordinates: MapSet.new()}
  # end

  defp offsets(:square) do
    [{0, 0}, {0, 1}, {1, 0}, {1, 1}]
  end
  defp offsets(:atoll) do
    [{0, 0}, {0, 1}, {1, 1}, {2, 0}, {2, 1}]
  end
  defp offsets(:dot) do
    [{0, 0}]
  end
  defp offsets(:l_shape) do
    [{0, 0}, {1, 0}, {2, 0}, {2, 1}]
  end
  defp offsets(:s_shape) do
    [{0, 1}, {0, 2}, {1, 0}, {1, 1}]
  end
  defp offsets(_) do
    {:error, :invalid_island_type}
  end

  defp add_coordinates(offsets, upper_left) do
    Enum.reduce_while(offsets, MapSet.new(), fn offset, acc ->
      add_coordinates(acc, upper_left, offset)
    end)
  end

  defp add_coordinates(coordinates, %Coordinate{row: row, col: col}, {row_offset, col_offset}) do
    case Coordinate.new(row + row_offset, col + col_offset) do
      {:ok, coordinate} ->
        {:cont, MapSet.put(coordinates, coordinate)}
      {:error, :invalid_coordinate} ->
        {:halt, {:error, :invalid_coordinate}}
    end
  end

  def new(type, %Coordinate{} = upper_left) do
    with [_|_] = offsets <- offsets(type), %MapSet{} = coordinates <- add_coordinates(offsets, upper_left)
    do
      {:ok, %Island{coordinates: coordinates, hit_coordinates: MapSet.new()}}
    else
      error -> error
    end
  end
end
