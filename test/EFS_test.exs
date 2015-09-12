defmodule EFSTest do
  use ExUnit.Case

  test "reduce/2 is working" do
    assert EFS.reduce([1, 2, 3], &+/2) == 6
  end

  test "reduce/2 with an empty enumerable raise EmptyError" do
    assert_raise Enum.EmptyError, fn -> EFS.reduce([], &+/2) end
  end

  test "reduce/3 is working" do
    assert EFS.reduce([1, 2, 3], 0, &+/2) == 6
  end

  test "reduce/3 with an empty enumerable return the accumulator" do
    assert EFS.reduce([], 0, &+/2) == 0
  end

  test "all? is working" do
    assert EFS.all?([2, 4, 6], fn(x) -> rem(x, 2) == 0 end)
    refute EFS.all?([2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
    assert EFS.all?([1, 2, 3])
    refute EFS.all?([1, nil, 3])
  end

  test "any? is working" do
    refute EFS.any?([2, 4, 6], fn(x) -> rem(x, 2) == 1 end)
    assert EFS.any?([2, 3, 4], fn(x) -> rem(x, 2) == 1 end)
    refute EFS.any?([false, false, false])
    assert EFS.any?([false, true, false])
  end

  test "at is working" do
    assert EFS.at([2, 4, 6], 0) == 2
    assert EFS.at([2, 4, 6], 0) == 6
    assert EFS.at([2, 4, 6], 4) == nil
    assert EFS.at([2, 4, 6], 4, :none) == :none
  end
end
