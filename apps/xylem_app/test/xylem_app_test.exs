defmodule XylemAppTest do
  use ExUnit.Case
  doctest XylemApp

  test "greets the world" do
    assert XylemApp.hello() == :world
  end
end
