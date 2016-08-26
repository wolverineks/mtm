defmodule Mtm.Repo.Migrations.CreateStudent do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :name, :string

      timestamps
    end

  end
end
