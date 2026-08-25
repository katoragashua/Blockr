defmodule Blockr.Game.Board do
  defstruct score: 0,
            tetromino: nil,
            walls: [],
            junkyard: [],
            game_over: false,
            points: MapSet.new([])

  alias Blockr.Game.{Tetromino, Color}

  def new(options \\ []) do
    # struct(__MODULE__, options)
    __struct__(options)
    |> new_tetro()
    |> add_walls()
  end

  def new_tetro(board) do
    %{
      board
      | tetromino:
          Tetromino.new(%{
            name: random_tetro(),
            location: {0, 3},
            color: apply(Color, random_tetro(), [])
          })
    }
  end

  def add_walls(board) do
    walls =
      for row <- 0..21, col <- 0..11, row in [0, 21] or col in [0, 11], into: [], do: {row, col}

    %{board | walls: walls, points: MapSet.new(walls)}
  end

  def show(board) do
    tetro =
      board.tetromino
      |> Tetromino.to_group()

    [tetro, board.walls, board.junkyard]
  end

  defp random_tetro do
    [:i, :j, :l, :o, :s, :t, :z]
    |> Enum.random()
  end

  def detach(board = %__MODULE__{}) do
    to_junkyard =
      board.tetromino
      |> Tetromino.to_group()

    new_points =
      Enum.map(to_junkyard, fn {point, _color} -> point end)
      |> MapSet.new()
      |> MapSet.union(board.points)

    # junkyard = Enum.reduce(to_junkyard, board.junkyard, fn x, acc -> [x | acc] end)
    junkyard = to_junkyard ++ board.junkyard
    IO.inspect(junkyard, label: "Junkyard after adding tetromino")
    %{board | junkyard: junkyard, points: new_points}
  end

  def count_complete_rows(board = %__MODULE__{}) do
    board.junkyard
    |> Enum.reduce([], fn {point, _color}, acc -> [point | acc] end)
    |> Enum.group_by(fn {row, _col} -> row end)
    |> Map.values()
    |> Enum.count(&(length(&1) == 10))
  end
end
