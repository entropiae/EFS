defmodule EFS do
  def reduce([], _), do: raise Enum.EmptyError
  def reduce([h|t], fun), do: reduce(t, h, fun)

  def reduce([], acc, _), do: acc
  def reduce([h|t], acc, fun), do: reduce(t, fun.(acc, h), fun)

  def all?(collection, fun \\ fn x -> x end) do
    reduce(collection, true, fn(acc, x) -> acc && fun.(x) end)
  end

  def any?(collection, fun \\ fn x -> x end) do
    reduce(collection, false, fn(acc, x) -> acc || fun.(x) end)
  end

  def at(collection, n, default \\ nil)
  def at([h|_], 0, _), do: h
  def at([], _, default), do: default
  def at([_|t], n, default), do: at(t, n - 1, default)
end
