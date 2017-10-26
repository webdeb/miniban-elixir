iterations = 100_000
iban = "MD75EX0900002374642125EU"

Benchee.run(%{
  "Miniban" => fn -> for _ <- 0..iterations, do: Miniban.is_valid_iban?(iban) end,
  "Bankster" => fn -> for _ <- 0..iterations, do: Bankster.iban_valid?(iban) end,
})
