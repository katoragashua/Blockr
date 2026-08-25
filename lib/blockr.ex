defmodule Blockr do
  @moduledoc """
  Documentation for `Blockr`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Blockr.hello()
      :world

  """
  def hello do
    :world
  end

  def histogram(list, acc \\ %{})

  def histogram([], acc), do: acc

  def histogram([head | tail], acc) do
    acc = Map.update(acc, head, 1, fn x -> x + 1 end)
    histogram(tail, acc)
  end
end
