defmodule CellularAutomata do

  def main(rule_int, height) do
    init(rule_int, height)
    |> generate(height - 1)
    |> Draw.main(rule_int)
  end

  def main(rule_int, height, rounds) do
    init(rule_int, height)
    |> generate(height - 1)
    |> GameOfLife.main(rounds)
  end

  def init(rule_int, height) do
    seqs =
      for n <- 0..7 do
        Integer.to_string(n, 2)
        |> String.pad_leading(3, "0")
      end
      |> Enum.reverse

    bits =
      Integer.to_string(rule_int, 2)
      |> String.pad_leading(8, "0")
      |> String.split("", trim: true)
    
    ruleset = 
      for {seq, bit} <- Enum.zip(seqs, bits), into: %{} do
        {seq, bit}
      end
    
    rows = [List.duplicate("0", height - 1) ++ ["1"] ++ List.duplicate("0", height - 1)]
    %Pattern{ruleset: ruleset, rows: rows, width: height * 2 - 1, height: height}
  end

  def read_row(%Pattern{ruleset: ruleset, rows: rows} = pattern) do
    next_row = 
      Enum.chunk_every(["0"] ++ List.last(rows) ++ ["0"], 3, 1, :discard)
      |> Enum.map(fn seq -> ruleset[Enum.join(seq, "")] end)
    %Pattern{pattern | rows: rows ++ [next_row]}
  end

  def generate(%Pattern{rows: rows} = pattern, rows_left) when rows_left <= 0 do
    rows = 
      Enum.map rows, fn row ->
        Enum.map row, fn cell ->
          elem(Integer.parse(cell), 0)
        end
      end
    %Pattern{pattern | rows: rows}
  end

  def generate(pattern, rows_left) do
    generate(read_row(pattern), rows_left - 1)
  end

end
