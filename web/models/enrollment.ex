defmodule Mtm.Enrollment do
  use Mtm.Web, :model

  schema "enrollments" do
    belongs_to :student, Mtm.Student
    belongs_to :class, Mtm.Class

    timestamps
  end

  @required_fields ~w(student_id class_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
