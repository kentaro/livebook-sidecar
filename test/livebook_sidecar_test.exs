defmodule LivebookSidecarTest do
  use ExUnit.Case
  doctest LivebookSidecar

  test "greets the world" do
    assert LivebookSidecar.hello() == :world
  end
end
