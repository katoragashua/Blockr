defmodule Blockr.Game.Point do
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

  def move_to({row, col}, {new_row, new_col}) do
    {row + new_row, col + new_col}
  end

  def swap({row, col}) do
    {col, row}
  end

  def flip_left_right({row, col}) do
    {row, 5 - col}
  end

  def flip_top_bottom({row, col}) do
    {5 - row, col}
  end

  def rotate(point, 0) do
    point
  end

  def rotate({__row, _col} = point, 90) do
    point
    |> swap()
    |> flip_left_right()
  end

  def rotate({_row, _col} = point, 180) do
    point
    |> flip_left_right()
    |> flip_top_bottom()
  end

  def rotate({_row, _col} = point, 270) do
    point
    |> swap()
    |> flip_top_bottom()
  end

  def paint({_row, _col} = point, color) do
    {point, color}
  end
end

# defmodule Point do

#   defstruct row: 0, col: 0
#   def new(row, col) do
#     %Point{row: row, col: col}
#   end

#   def move_down(point) do
#     %Point{row: row, col: col} = point
#     %Point{row: row + 1, col: col}
#   end

#   def move_left(point) do
#     %Point{row: row, col: col} = point
#     %Point{row: row, col: col - 1}
#   end

#   def move_right(point) do
#     %Point{row: row, col: col} = point
#     %Point{row: row, col: col + 1}
#   end

#   def swap(%Point{row: row, col: col}) do
#     %Point{row: col, col: row}
#   end

#   def flip_left_right(%Point{row: row, col: col}) do
#     %Point{row: row, col: 5 - col}
#   end

#   def flip_top_bottom(%Point{row: row, col: col}) do
#     %Point{row: 5 - row, col: col}
#   end

#   def rotate(point,0) do
#     point
#   end

#   def rotate(%Point{row: _row, col: _col} = point, 90) do
#     point
#     |> swap()
#     |> flip_left_right()
#   end

#   def rotate(%Point{row: _row, col: _col} = point, 180) do
#     point
#     |> flip_left_right()
#     |> flip_top_bottom()
#   end

#   def rotate(%Point{row: _row, col: _col} = point, 270) do
#     point
#     |> swap()
#     |> flip_top_bottom()
#   end

# end
