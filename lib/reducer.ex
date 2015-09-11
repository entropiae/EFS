defmodule Reducer do
  def reduce([], _), do: raise Enum.EmptyError
  def reduce([h|t], fun), do: reduce(t, h, fun)

  def reduce([], acc, _), do: acc
  def reduce([h|t], acc, fun), do: reduce(t, fun.(acc, h), fun)
end
