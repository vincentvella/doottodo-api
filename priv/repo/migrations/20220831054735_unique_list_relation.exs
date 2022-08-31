defmodule DootTodo.Repo.Migrations.UniqueListRelation do
  use Ecto.Migration

  def change do
    create unique_index(:lists_on_users, [:list_id, :user_id])
  end
end
