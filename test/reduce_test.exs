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

  test "all? is working" do
    assert Reducer.all?([2, 4, 6], fn(x) -> rem(x, 2) == 0 end)
    refute Reducer.all?([2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
    assert Reducer.all?([1, 2, 3])
    refute Reducer.all?([1, nil, 3])
  end

  test "any? is working" do
    refute Reducer.any?([2, 4, 6], fn(x) -> rem(x, 2) == 1 end)
    assert Reducer.any?([2, 3, 4], fn(x) -> rem(x, 2) == 1 end)
    refute Reducer.any?([false, false, false])
    assert Reducer.any?([false, true, false])
  end
end
