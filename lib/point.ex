defmodule Point do

  defstruct row: 0, col: 0
  def new(row, col) do
    %Point{row: row, col: col}
  end

  def move_down(point) do
    %Point{row: row, col: col} = point
    %Point{row: row + 1, col: col}
  end

  def move_left(point) do
    %Point{row: row, col: col} = point
    %Point{row: row, col: col - 1}
  end

  def move_right(point) do
    %Point{row: row, col: col} = point
    %Point{row: row, col: col + 1}
  end

  def swap(%Point{row: row, col: col}) do
    %Point{row: col, col: row}
  end

  def flip_left_right(%Point{row: row, col: col}) do
    %Point{row: row, col: 5 - col}
  end

  def flip_top_bottom(%Point{row: row, col: col}) do
    %Point{row: 5 - row, col: col}
  end

  def rotate(point,0) do
    point
  end

  def rotate(%Point{row: _row, col: _col} = point, 90) do
    point
    |> swap()
    |> flip_left_right()
  end

  def rotate(%Point{row: _row, col: _col} = point, 180) do
    point
    |> flip_left_right()
    |> flip_top_bottom()
  end

  def rotate(%Point{row: _row, col: _col} = point, 270) do
    point
    |> swap()
    |> flip_top_bottom()
  end

end
