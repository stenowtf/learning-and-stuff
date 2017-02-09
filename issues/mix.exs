defmodule Issues.Mixfile do
  use Mix.Project

  def project do
    [
      app: :issues,
      name: "Issues",
      source_url: "https://github.com/stenowtf/learning-and-stuff/tree/master/issues",
      escript: escript_config(),
      version: "0.1.0",
      elixir: "~> 1.4",
      build_embedded: Mix.env == :prod,
      start_permanent: Mix.env == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
      ],
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:httpoison, "~> 0.11.0"},
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.14.5"},
      {:earmark, "~> 1.1", override: true},
      {:excoveralls, "~> 0.6.2", only: :test}
    ]
  end

  defp escript_config do
    [main_module: Issues.CLI]
  end
end
