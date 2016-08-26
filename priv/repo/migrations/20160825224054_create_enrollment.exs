defmodule Mtm.Repo.Migrations.CreateEnrollment do
  use Ecto.Migration

  def change do
    create table(:enrollments) do
      add :student_id, references(:students, on_delete: :nothing)
      add :class_id, references(:classes, on_delete: :nothing)

      timestamps
    end
    create index(:enrollments, [:student_id])
    create index(:enrollments, [:class_id])

  end
end
