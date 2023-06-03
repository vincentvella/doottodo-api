defmodule DootTodo.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION IF NOT EXISTS citext", "")

    create table(:users, primary_key: false) do
      add(:id, :uuid, primary_key: true, null: false)
      add(:aud, :string, null: false, default: "authenticated")
      add(:role, :string, null: false, default: "authenticated")
      add(:email, :citext, null: false)
      add(:password_hash, :string, null: false)
      timestamps()
    end

    create unique_index(:users, [:email])

    create table(:identities, primary_key: false) do
      # Table id
      add(:id, :uuid, null: false)
      # Id from identity proider
      add(:uid, :string, null: false)
      # Provider
      add(:provider, :string, null: false)
      add(:user_id, references(:users, type: :uuid, on_delete: :nothing), null: false)
      add(:identity_data, :map, null: false)
      add(:last_sign_in_at, :utc_datetime_usec)

      timestamps()
    end

    create unique_index(:identities, [:uid, :provider])

    create table(:users_tokens) do
      add(:user_id, references(:users, type: :uuid, on_delete: :delete_all), null: false)
      add(:token, :binary, null: false)
      add(:context, :string, null: false)
      add(:revoked, :boolean, default: false)
      add(:sent_to, :string)
      timestamps(updated_at: false)
    end

    create(index(:users_tokens, [:user_id]))
    create(unique_index(:users_tokens, [:context, :token]))

    create table(:account, primary_key: false) do
      add(:id, :uuid, primary_key: true, null: false)
      add(:user_id, references(:users, type: :uuid, on_delete: :delete_all), null: false)
      add(:invited_at, :utc_datetime_usec)
      add(:confirmation_token, :string)
      add(:confirmation_sent_at, :utc_datetime_usec)
      add(:confirmed_at, :utc_datetime_usec)
      add(:recovery_token, :string)
      add(:recovery_sent_at, :utc_datetime_usec)
      add(:email_confirmed_at, :utc_datetime_usec)
      add(:email_change_token_new, :string)
      add(:email_change, :string)
      add(:email_change_sent_at, :utc_datetime_usec)
      add(:last_sign_in_at, :utc_datetime_usec)
      add(:raw_app_metadata, :map)
      add(:raw_user_metadata, :map)
      add(:phone, :string)
      add(:phone_confirmed_at, :utc_datetime_usec)
      add(:phone_change, :string)
      add(:phone_change_token, :string)
      add(:phone_change_sent_at, :utc_datetime_usec)
      add(:email_change_token_current, :string)
      add(:email_change_confirm_status, :integer)
      add(:banned_until, :utc_datetime_usec)
      add(:reauthentication_token, :string)
      add(:reauthentication_sent_at, :utc_datetime_usec)
      add(:is_super_admin, :boolean, default: false, null: false)

      timestamps()
    end
  end
end
