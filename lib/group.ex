defmodule Group do

  def move_down(points) do
    points |> Enum.map(fn {row, col} -> {row + 1, col} end)
  end

  def move_left(points) do
    points |> Enum.map(fn {row, col} -> {row, col - 1} end)
  end

  def move_right(points) do
    points |> Enum.map(fn {row, col} -> {row, col + 1} end)
  end

  def swap(points) do
    points |> Enum.map(fn {row, col} -> {col, row} end)
  end

  def flip_left_right(points) do
    points |> Enum.map(fn {row, col} -> {row, 5 - col} end)
  end

  def flip_top_bottom(points) do
    points |> Enum.map(fn {row, col} -> {5 - row, col} end)
  end

  def rotate(points,0) do
    points
  end

  def rotate(points, 90) do
    points
    |> Enum.map(fn {row, col} -> {col, row} end)
    |> Enum.map(fn {row, col} -> {row, 5 - col} end)

  end

  def rotate(points, 180) do
    points
    |> Enum.map(fn {row, col} -> {row, 5 - col} end)
    |> Enum.map(fn {row, col} -> {5 - row, col} end)
  end

  def rotate(points, 270) do
    points
    |> Enum.map(fn {row, col} -> {col, row} end)
    |> Enum.map(fn {row, col} -> {5 - row, col} end)
  end
end
