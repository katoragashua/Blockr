defmodule BlockrTest do
  use ExUnit.Case
  doctest Blockr

  test "greets the worlds" do
    assert Blockr.hello() == :world
  end
end
