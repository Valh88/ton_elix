defmodule TonElixTest do
  use ExUnit.Case
  doctest TonElix

  test "greets the world" do
    assert TonElix.hello() == :world
  end
end
