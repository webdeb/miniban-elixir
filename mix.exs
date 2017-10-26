defmodule Miniban.MixProject do
  use Mix.Project

  def project do
    [
      app: :miniban,
      version: "0.1.0",
      elixir: "~> 1.6-dev",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # for benchmarks comparison
      {:benchee, "~> 0.10", only: :dev},
      {:bankster, "~> 0.2.2", only: :dev}
    ]
  end
end
