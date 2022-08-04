defmodule DootTodo.Repo.Migrations.CreateIdentities do
  use Ecto.Migration

  def change do
    create table(:identities, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :provider, :string, primary_key: true, null: false
      add :user_id, :uuid, null: false
      add :identity_data, :map, null: false
      add :last_sign_in_at, :utc_datetime_usec

      timestamps()
    end
  end
end
