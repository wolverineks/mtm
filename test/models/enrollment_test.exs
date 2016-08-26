defmodule Mtm.EnrollmentTest do
  use Mtm.ModelCase

  alias Mtm.Enrollment

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Enrollment.changeset(%Enrollment{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Enrollment.changeset(%Enrollment{}, @invalid_attrs)
    refute changeset.valid?
  end
end
