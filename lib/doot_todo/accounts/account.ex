defmodule DootTodo.Accounts.Account do
  use DootTodo.Schema
  alias DootTodo.Users.User

  schema "accounts" do
    field :invited_at, :utc_datetime_usec
    field :confirmation_token, :string
    field :confirmation_sent_at, :string
    field :confirmed_at, :utc_datetime_usec
    field :recovery_token, :string
    field :recovery_sent_at, :utc_datetime_usec
    field :recovery_confirmed_at, :utc_datetime_usec
    field :email_confirmed_at, :utc_datetime_usec
    field :email_change_token_new, :string
    field :email_change, :string
    field :email_change_sent_at, :utc_datetime_usec
    field :last_sign_in_at, :utc_datetime_usec
    field :phone, :string
    field :phone_confirmed_at, :utc_datetime_usec
    field :phone_change, :string
    field :phone_change_token, :string
    field :phone_change_sent_at, :utc_datetime_usec
    field :phone_change_token_current, :string
    field :phone_change_confirm_status, :integer
    field :banned_until, :utc_datetime_usec
    field :reauthentication_token, :string
    field :reauthentication_sent_at, :utc_datetime_usec
    belongs_to :user, User, type: Ecto.UUID
    timestamps()
  end
end
