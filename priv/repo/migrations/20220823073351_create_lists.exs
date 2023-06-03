defmodule DootTodo.Repo.Migrations.CreateLists do
  use Ecto.Migration

  def change do
    create table(:lists, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :title, :string

      timestamps()
    end

    create table(:lists_on_users) do
      add :user_id, references(:users, type: :uuid, on_delete: :nothing), null: false
      add :list_id, references(:lists, type: :uuid), null: false

      timestamps()
    end
  end
end
