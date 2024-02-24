defmodule TonElix.MixProject do
  use Mix.Project

  def project do
    [
      app: :ton_elix,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {TonElix.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:ton, "~> 0.4.5"},
      {:httpoison, "~> 2.2.1"},
      {:jason, "~> 1.4.1"},
    ]
  end
end
