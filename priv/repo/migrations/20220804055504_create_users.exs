defmodule DootTodo.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :id, :uuid, primary_key: true, null: false
      add :aud, :string
      add :role, :string
      add :email, :string
      add :encrypted_password, :string
      add :email_confirmed_at, :utc_datetime_usec
      add :invited_at, :utc_datetime_usec
      add :confirmation_token, :string
      add :confirmation_sent_at, :utc_datetime_usec
      add :recovery_token, :string
      add :recovery_sent_at, :utc_datetime_usec
      add :email_change_token_new, :string
      add :email_change, :string
      add :email_change_sent_at, :utc_datetime_usec
      add :last_sign_in_at, :utc_datetime_usec
      add :raw_app_metadata, :map
      add :raw_user_metadata, :map
      add :is_super_admin, :boolean, default: false, null: false
      add :phone, :string
      add :phone_confirmed_at, :utc_datetime_usec
      add :phone_change, :string
      add :phone_change_token, :string
      add :phone_change_sent_at, :utc_datetime_usec
      add :confirmed_at, :utc_datetime_usec
      add :email_change_token_current, :string
      add :email_change_confirm_status, :integer
      add :banned_until, :utc_datetime_usec
      add :reauthentication_token, :string
      add :reauthentication_sent_at, :utc_datetime_usec

      timestamps()
    end
  end
end
