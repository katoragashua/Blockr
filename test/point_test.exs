defmodule PointTest do
  use ExUnit.Case

  test "creates a new point" do
    assert Point.new(1,2) == {1, 2}
  end

  test "moves a point down" do
    assert Point.move_down({1, 2}) == {2, 2}
  end

  test "moves a point left" do
    assert Point.move_left({1, 2}) == {1, 1}
  end

  test "moves a point right" do
    assert Point.move_right({1, 2}) == {1, 3}
  end
end
