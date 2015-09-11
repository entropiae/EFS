defmodule Reducer do
  def reduce([], acc, _) do
    acc
  end

  def reduce([h|t], acc, fun) do
    reduce(t, fun.(acc, h), fun)
  end
end
