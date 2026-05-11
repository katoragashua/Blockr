defmodule Point do
  def new(row, col) do
    {row, col}
  end

  def move_down(point) do
    {row, col} = point
    {row + 1, col}
  end

  def move_left(point) do
    {row, col} = point
    {row, col - 1}
  end

  def move_right(point) do
    {row, col} = point
    {row, col + 1}
  end

  def swap({row,col}) do
    {col,row}
  end

  def flip_left_right({row, col}) do
    {row, 5 - col}
  end

  def flip_top_bottom({row, col}) do
    {5 - row, col}
  end

  def rotate(point,0) do
    point
  end

  def rotate(point, 90) do
    point
    |> swap()
    |> flip_left_right()
  end

  def rotate(point, 180) do
    point
    |> flip_left_right()
    |> flip_top_bottom()
  end

  def rotate(point, 270) do
    point
    |> swap()
    |> flip_top_bottom()
  end

end
