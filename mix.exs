defmodule Ipfinder.MixProject do
  use Mix.Project

  def project do
    [
      app: :ipfinder,
      version: "1.0.0",
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "Official elixir client library for IPfinder",
      docs: [extras: ["README.md"]],
      homepage_url: " https://ipfinder.io/",
      source_url: "https://github.com/ipfinder-io/ip-finder-elixir",
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger,:httpotion]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpotion, "~> 3.1.0"},
      {:jason, "~> 1.1"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end

  defp package do
    [
       name: :ipfinder,
       files: ["lib/*", "mix.exs", "README.md", "LICENSE", "CHANGELOG.md"],
       maintainers: ["Mohamed Ben rebia <mohamed@ipfinder.io>"],
       licenses: ["Apache-2.0"],
       links: %{ "GitHub" => "https://github.com/ipfinder-io/ip-finder-elixir" }
     ]
  end
end
