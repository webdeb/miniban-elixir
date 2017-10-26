defmodule MinibanTest do
  use ExUnit.Case
  doctest Miniban

  @valid [
    "MD75EX0900002374642125EU",
    "BE68539007547034",
    "NL86INGB0002445588",
  ]

  @invalid [
    "ZZ68539007547034",
    "BE68539007547035",
  ]

  test "valid iban" do
    assert Enum.reduce(@valid, true, fn iban, ok -> ok && Miniban.is_valid_iban?(iban) end)
  end
  test "invalid iban" do
    refute Enum.reduce(@invalid, true, fn iban, ok -> ok && Miniban.is_valid_iban?(iban) end)
  end
end
