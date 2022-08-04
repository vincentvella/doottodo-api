defmodule DootTodo.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :title, :string
      add :completed_at, :utc_datetime

      timestamps()
    end
  end
end
