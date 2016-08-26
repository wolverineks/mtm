defmodule Mtm.Repo.Migrations.CreateClass do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :topic, :string

      timestamps
    end

  end
end
