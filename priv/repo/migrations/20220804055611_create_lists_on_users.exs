defmodule DootTodo.Repo.Migrations.CreateListsOnUsers do
  use Ecto.Migration

  def change do
    create table(:lists_on_users) do
      add :user_id, references(:users, type: :uuid), null: false
      add :list_id, references(:lists, type: :uuid), null: false

      timestamps()
    end
  end
end
