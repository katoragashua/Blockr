defmodule Blockr.Game.Canvas do
  def new(content) do
    """
    <svg width="120" height="220" xmlns="http://www.w3.org/2000/svg">
    #{draw(content, 10)}
    </svg>
    """
    |> Kino.Image.new(:svg)
  end

  def tetromino(content) do
    """
    <svg width="100" height="100" xmlns="http://www.w3.org/2000/svg">
    #{draw(content, 25)}
    </svg>
    """
    |> Kino.Image.new(:svg)
  end

  def draw({{row, col}, color}, width) when is_binary(color) do
    x = (col - 1) * width + 10
    y = (row - 1) * width + 10
    # IO.inspect({x, y}, label: "Drawing rect")

    """
    <rect x="#{x}" y="#{y}" width="#{width}" height="#{width}"  fill="#{color}" />
    """
  end

  def draw({_row, _col} = point, width) do
    draw({point, "black"}, width)
  end

  def draw(points, width) when is_list(points) do
    # IO.inspect(points, label: "Drawing points")

    points
    |> Enum.map_join(&draw(&1, width))
  end
end
