defmodule Blockr.Game.Tetromino do
  alias Blockr.Game.{Point, Group, Color}

  # defstruct name: "", points: [], rotation: 0, color: ""
  defstruct name: :i, location: {0, 0}, rotation: 0, color: ""

  def new do
    %__MODULE__{}
  end

  def new(options) when is_map(options) do # You can also use `when is_list(options)` if you want to accept keyword lists as well
    # struct(__MODULE__, options)
    __struct__(options)
  end

  def new(name) do
    %__MODULE__{name: name, color: apply(Color, name, [])}
  end

  def left(tetromino = %__MODULE__{}) do
    %__MODULE__{tetromino | location: Point.move_left(tetromino.location)}
  end

  def right(tetromino = %__MODULE__{}) do
    %__MODULE__{tetromino | location: Point.move_right(tetromino.location)}
  end

  def fall(tetromino = %__MODULE__{}) do
    %__MODULE__{tetromino | location: Point.move_down(tetromino.location)}
  end

  def rotate_right_90(tetromino = %__MODULE__{rotation: 270}) do
    %__MODULE__{tetromino | rotation: 0}
  end

  def rotate_right_90(tetromino = %__MODULE__{}) do
    %__MODULE__{tetromino | rotation: tetromino.rotation + 90}
  end

  # This is another way to solve the problem using math. The above solution is more readable, but this one is more concise.
  # def rotate_left_90(tetromino = %__MODULE__{}) do
  #   %__MODULE__{tetromino | rotation: rem(tetromino.rotation + 90, 360)}
  # end

  def to_group(tetromino = %__MODULE__{}) do
    case tetromino.name do
      :i -> [{1, 2}, {2, 2}, {3, 2}, {4, 2}]
      :j -> [{1, 2}, {2, 2}, {3, 2}, {3, 1}]
      :l -> [{1, 2}, {2, 2}, {3, 2}, {3, 3}]
      :o -> [{2, 2}, {2, 3}, {3, 2}, {3, 3}]
      :s -> [{2, 3}, {2, 4}, {3, 2}, {3, 3}]
      :t -> [{1, 2}, {2, 2}, {3, 2}, {2, 3}]
      :z -> [{2, 2}, {2, 3}, {3, 3}, {3, 4}]
      _ -> []
    end
    |> Group.rotate(tetromino.rotation)
    |> Group.move_to(tetromino.location)
    |> Group.paint(tetromino.name)
  end
end

"""
i: *
   *
   *
   *

o: **
   **

t: ***
    *

s:  **
   **

z: **
    **

j:  *
    *
   **

l:  *
    *
    **
"""
