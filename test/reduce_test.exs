defmodule ReducerTest do
  use ExUnit.Case

  test "reduce/2 is working" do
    assert Reducer.reduce([1, 2, 3], &+/2) == 6
  end

  test "reduce/2 with an empty enumerable raise EmptyError" do
    assert_raise Enum.EmptyError, fn -> Reducer.reduce([], &+/2) end
  end

  test "reduce/3 is working" do
    assert Reducer.reduce([1, 2, 3], 0, &+/2) == 6
  end

  test "reduce/3 with an empty enumerable return the accumulator" do
    assert Reducer.reduce([], 0, &+/2) == 0
  end
end
