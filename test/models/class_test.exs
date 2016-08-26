defmodule Mtm.ClassTest do
  use Mtm.ModelCase

  alias Mtm.Class

  @valid_attrs %{topic: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Class.changeset(%Class{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Class.changeset(%Class{}, @invalid_attrs)
    refute changeset.valid?
  end
end
