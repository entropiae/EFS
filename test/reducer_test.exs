defmodule ReducerTest do
  use ExUnit.Case

  test "Basic reduce is working" do
    assert Reducer.reduce([1, 2, 3], 0, &+/2) == 6
  end
end
