defmodule Miniban do
  @moduledoc """
  Documentation for Miniban.
  """

  @country_code_len %{
    "AD" => 24, "AE" => 23, "AT" => 20, "AZ" => 28, "BA" => 20, "BE" => 16, "BG" => 22, "BH" => 22, "BR" => 29,
    "CH" => 21, "CR" => 21, "CY" => 28, "CZ" => 24, "DE" => 22, "DK" => 18, "DO" => 28, "EE" => 20, "ES" => 24,
    "FI" => 18, "FO" => 18, "FR" => 27, "GB" => 22, "GI" => 23, "GL" => 18, "GR" => 27, "GT" => 28, "HR" => 21,
    "HU" => 28, "IE" => 22, "IL" => 23, "IS" => 26, "IT" => 27, "JO" => 30, "KW" => 30, "KZ" => 20, "LB" => 28,
    "LI" => 21, "LT" => 20, "LU" => 20, "LV" => 21, "MC" => 27, "MD" => 24, "ME" => 22, "MK" => 19, "MR" => 27,
    "MT" => 31, "MU" => 30, "NL" => 18, "NO" => 15, "PK" => 24, "PL" => 28, "PS" => 29, "PT" => 25, "QA" => 29,
    "RO" => 24, "RS" => 22, "SA" => 24, "SE" => 24, "SI" => 19, "SK" => 24, "SM" => 27, "TN" => 24, "TR" => 26,
  }

  @doc """
    Validate an IBAN
  """
  def is_valid_iban?(input) do
    { prefix, rest } = String.replace(input, ~r/ +/, "")
      |> String.upcase()
      |> String.split_at(4)

    iban = rest <> prefix

    @country_code_len[String.slice(prefix, 0..1)] == String.length(iban) &&
      1 == Regex.replace(~r/[A-Z]/, iban, fn << c :: 8 >> -> to_string(c - 55) end)
      |> String.to_integer()
      |> rem(97)
  end
end
