defmodule Servy.Plugins do
  require Logger

  def rewrite_path(%{ path: "/wildlife" } = conv) do
    %{ conv | path: "/wildthings" }
  end

  def rewrite_path(%{ path: "/bears?id=" <> id } = conv) do
    %{ conv | path: "/bears/#{id}" }
  end

  def rewrite_path(conv) do
    conv
  end

  @doc "Logs 404 requests"
  def log(conv) do
    Logger.info fn ->
      "conv: #{inspect(conv)}"
    end
    conv
  end

  def track(%{ status: 404, path: path } = conv) do
    Logger.warn fn ->
      "Warning: #{path} is on the loose!"
    end
    conv
  end

  def track(conv) do
    conv
  end
end
