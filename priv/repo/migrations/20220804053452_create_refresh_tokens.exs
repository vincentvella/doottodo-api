defmodule DootTodo.Repo.Migrations.CreateRefreshTokens do
  use Ecto.Migration

  def change do
    create table(:refresh_tokens, primary_key: false) do
      add :id, :integer, primary_key: true, null: false
      add :token, :string, null: false
      add :user_id, :uuid, null: false
      add :revoked, :boolean, default: false, null: false
      add :parent, :string

      timestamps()
    end
  end
end
