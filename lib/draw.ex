defmodule Draw do
  def main(pattern, filename) do
    build_pixel_map(pattern)
    |> draw_image
    |> save_image(filename)
  end

  def build_pixel_map(%Pattern{rows: rows, width: width} = pattern) do
    pixel_map =
      List.flatten(rows)
      |> Enum.with_index
      |> Enum.filter(fn {cell, _i} -> cell > 0 end)
      |> Enum.map(fn {_cell, i} ->
        horizontal = rem(i, width) * 10
        vertical = div(i, width) * 10
        {{horizontal, vertical}, {horizontal + 10, vertical + 10}}
      end)
    %Pattern{pattern | pixel_map: pixel_map}
  end

  def draw_image(%Pattern{pixel_map: pixel_map, width: width, height: height}) do

    image = :egd.create(width * 10, height * 10)
    bg = :egd.color(:black)
    fill = :egd.color(:aqua)
    
    :egd.filledRectangle(image, {0, 0}, {width * 10, height * 10}, bg)

    Enum.each pixel_map, fn {start, stop} ->
      :egd.filledRectangle(image, start, stop, fill)
    end

    :egd.render(image)
  end

  def save_image(image, filename) do

    File.write("snaps/#{filename}.png", image)
  end
end