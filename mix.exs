defmodule Miniban.MixProject do
  use Mix.Project

  def project do
    [
      app: :miniban,
      name: "Miniban",
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      package: package(),
      description: description(),
      source_url: "https://github/webdeb/miniban-elixir",
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
      {:ex_doc, ">= 0.0.0", only: :dev},
      # for benchmarks comparison
      {:benchee, "~> 0.10", only: :dev},
      {:bankster, "~> 0.2.2", only: :dev}
    ]
  end

  defp description() do
    "Simple and fast IBAN validation"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "miniban",
      # These are the default files included in the package
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Boris Kotov"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github/webdeb/miniban-elixir"}
    ]
  end
end
