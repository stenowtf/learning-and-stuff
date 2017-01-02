defmodule Rumbl.Repo do
  @moduledoc """
  In memory repository.
  """

  def all(Rumbl.User) do
    [%Rumbl.User{id: "1", name: "steno c", username: "ste", password: "qwe"},
      %Rumbl.User{id: "2", name: "john b", username: "jo", password: "asd"},
      %Rumbl.User{id: "3", name: "kain l", username: "ka", password: "zxc"}]
  end
  def all(_module), do: []

  def get(module, id) do
    Enum.find all(module), fn map -> map.id == id end
  end

  def get_by(module, params) do
    Enum.find all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end
  end
end
