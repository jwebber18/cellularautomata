defmodule GameOfLife do
  def main(width, height, rounds) do
    init_grid(width, height)
    |> next_generation(rounds, rounds)
  end

  def main(pattern, rounds) do
    next_generation(pattern, rounds, rounds)
  end

  def init_grid(width, height) do
    rows = 
      for _cell <- 1..height do
        for _cell <- 1..width do
          case Enum.random(0..5) do
            0 -> 1
            _ -> 0
          end
        end
      end
    %Pattern{rows: rows, width: width, height: height}
  end
  
  def count_neighbors(%Pattern{rows: rows, width: width, height: height}, x, y) do
    live_cells =
      for x_coord <- x-1..x+1, y_coord <- y-1..y+1, {x_coord, y_coord} != {x, y} do
        {x_coord, y_coord}
      end
      |> Enum.filter(fn {x_coord, y_coord} ->
          x_coord > -1 and x_coord < width and 
          y_coord > -1 and y_coord < height and
          Enum.at(Enum.at(rows, y_coord), x_coord) > 0 end)
    length(live_cells)
  end

  def live_or_die(pattern, state, x, y) do
    case state do
      0 ->
        case count_neighbors(pattern, x, y) do
          3 -> 1
          _ -> 0
        end
      1 ->
        case count_neighbors(pattern, x, y) do
          2 -> 1
          3 -> 1
          _ -> 0
        end
    end
  end

  def next_generation(pattern, rounds_left, total_rounds) when rounds_left <= 0 do
    Draw.main(pattern, total_rounds)
  end

  def next_generation(%Pattern{rows: rows} = pattern, rounds_left, total_rounds) do
    rows = 
      for {row, y} <- Enum.with_index(rows) do
        for {cell, x} <- Enum.with_index(row) do
          live_or_die(pattern, cell, x, y)
        end
      end
    pattern = %Pattern{pattern | rows: rows}
    Draw.main(pattern, total_rounds - rounds_left)
    next_generation(pattern, rounds_left - 1, total_rounds)
  end

end
