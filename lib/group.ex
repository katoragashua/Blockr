defmodule Group do
  def move_down(points) do
    points |> Enum.map(&Point.move_down/1)
  end

  def move_left(points) do
    points |> Enum.map(&Point.move_left/1)
  end

  def move_right(points) do
    points |> Enum.map(&Point.move_right/1)
  end

  def swap(points) do
    points |> Enum.map(&Point.swap/1)
  end

  def flip_left_right(points) do
    points |> Enum.map(&Point.flip_left_right/1)
  end

  def flip_top_bottom(points) do
    points |> Enum.map(&Point.flip_top_bottom/1)
  end

  def rotate(points, degree) do
    points
    |> Enum.map(fn point -> Point.rotate(point, degree) end)
  end
end
