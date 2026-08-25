defmodule Blockr.Game do
  # Functions that support gameplay
  # API
  # Handle uncertainty of the game state, and provide a clean interface for the game logic.
  alias Blockr.Game.{Tetromino, Board}

  def new_board do
    Board.new()
  end

  def left(board = %Board{}) do
    new_tetro = Tetromino.left(board.tetromino)

    case safe_to_place?(%{board | tetromino: new_tetro}) do
      true -> %{board | tetromino: new_tetro}
      false -> board
    end
  end

  def right(board = %Board{}) do
    new_tetro = Tetromino.right(board.tetromino)

    case safe_to_place?(%{board | tetromino: new_tetro}) do
      true -> %{board | tetromino: new_tetro}
      false -> board
    end
  end

  def fall(board = %Board{}) do
    new_tetro = Tetromino.fall(board.tetromino)

    case safe_to_place?(%{board | tetromino: new_tetro}) do
      true ->
        %{board | tetromino: new_tetro}

      false ->
        IO.inspect(board.junkyard)
        # If the tetromino cannot fall further, we need to handle the crash.
        Board.detach(board)
        |> crash()
    end
  end

  def turn(board = %Board{}) do
    new_tetro = Tetromino.rotate_right_90(board.tetromino)

    case safe_to_place?(%{board | tetromino: new_tetro}) do
      true -> %{board | tetromino: new_tetro}
      false -> board
    end
  end

  # def overlaps_x(board = %Board{}) do
  #   board
  #   |> Map.get(:tetromino)
  #   |> Tetromino.to_group()
  #   |> Enum.map(fn {points, _color} -> points end)
  #   |> Enum.map(fn {_row, col} -> col end)
  #   |> Enum.any?(fn col -> col == 2 or col == 10 end)
  # end

  # def check_collision(board = %Board{}) do
  #   tetro = board.tetromino
  #   |> Tetromino.to_group()
  #   |> Enum.map(fn {points, _color} -> points end)

  #   junkyard = board.junkyard

  #   Enum.any?(tetro, fn point -> Enum.member?(junkyard, point) end)
  # end

  defp safe_to_place?(board = %Board{}) do
    tetro_points =
      board
      |> Map.get(:tetromino)
      |> Tetromino.to_group()
      |> Enum.map(fn {point, _color} -> point end)
      |> MapSet.new()

    intersection = MapSet.intersection(tetro_points, board.points)

    MapSet.size(intersection)
    |> Kernel.==(0)
  end

  def crash(board) do
    board |> Board.new_tetro()
  end
end

# CRC
# Constructor: Create a new game state.
# Reducer: Update the game state based on an action.
# Converter: Convert the game state to a different representation, such as a visual representation or a score.
