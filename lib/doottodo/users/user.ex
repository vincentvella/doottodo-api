defmodule DootTodo.Users.User do
  use DootTodo.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "users" do
    # aud description
    # https://docs.microsoft.com/en-us/azure/active-directory/develop/access-tokens#token-ownership
    field :aud, :string
    field :banned_until, :utc_datetime_usec
    field :confirmation_sent_at, :utc_datetime_usec
    field :confirmation_token, :string
    field :confirmed_at, :utc_datetime_usec
    field :email, :string
    field :email_change, :string
    field :email_change_confirm_status, :integer
    field :email_change_sent_at, :utc_datetime_usec
    field :email_change_token_current, :string
    field :email_change_token_new, :string
    field :email_confirmed_at, :utc_datetime_usec
    field :encrypted_password, :string
    field :invited_at, :utc_datetime_usec
    field :is_super_admin, :boolean, default: false
    field :last_sign_in_at, :utc_datetime_usec
    field :phone, :string
    field :phone_change, :string
    field :phone_change_sent_at, :utc_datetime_usec
    field :phone_change_token, :string
    field :phone_confirmed_at, :utc_datetime_usec
    field :raw_app_metadata, :map
    field :raw_user_metadata, :map
    field :reauthentication_sent_at, :utc_datetime_usec
    field :reauthentication_token, :string
    field :recovery_sent_at, :utc_datetime_usec
    field :recovery_token, :string
    field :role, :string
    # External Relationships tied to user id
    many_to_many :lists, ListOnUser, join_through: DootTodo.ListsOnUsers.ListOnUser
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [
      :id,
      :aud,
      :role,
      :email,
      :encrypted_password,
      :email_confirmed_at,
      :invited_at,
      :confirmation_token,
      :confirmation_sent_at,
      :recovery_token,
      :recovery_sent_at,
      :email_change_token_new,
      :email_change,
      :email_change_sent_at,
      :last_sign_in_at,
      :raw_app_metadata,
      :raw_user_metadata,
      :is_super_admin,
      :phone,
      :phone_confirmed_at,
      :phone_change,
      :phone_change_token,
      :phone_change_sent_at,
      :confirmed_at,
      :email_change_token_current,
      :email_change_confirm_status,
      :banned_until,
      :reauthentication_token,
      :reauthentication_sent_at
    ])
    |> validate_required([
      :id,
      :aud,
      :role,
      :email,
      :encrypted_password,
      :email_confirmed_at,
      :invited_at,
      :confirmation_token,
      :confirmation_sent_at,
      :recovery_token,
      :recovery_sent_at,
      :email_change_token_new,
      :email_change,
      :email_change_sent_at,
      :last_sign_in_at,
      :raw_app_metadata,
      :raw_user_metadata,
      :is_super_admin,
      :phone,
      :phone_confirmed_at,
      :phone_change,
      :phone_change_token,
      :phone_change_sent_at,
      :confirmed_at,
      :email_change_token_current,
      :email_change_confirm_status,
      :banned_until,
      :reauthentication_token,
      :reauthentication_sent_at
    ])
  end
end
