defmodule Servy.Plugins do
  require Logger

  alias Servy.Conv

  def rewrite_path(%Conv{path: "/wildlife"} = conv) do
    %{conv | path: "/wildthings"}
  end

  def rewrite_path(%Conv{path: "/bears?id=" <> id} = conv) do
    %{conv | path: "/bears/#{id}"}
  end

  def rewrite_path(%Conv{} = conv) do
    conv
  end

  @doc "Logs 404 requests"
  def log(%Conv{} = conv) do
    Logger.info fn ->
      "conv: #{inspect(conv)}"
    end
    conv
  end

  def track(%Conv{status: 404, path: path} = conv) do
    Logger.warn fn ->
      "Warning: #{path} is on the loose!"
    end
    conv
  end

  def track(%Conv{} = conv) do
    conv
  end
end
