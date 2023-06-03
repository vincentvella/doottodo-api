defmodule DootTodo.Identities.UserIdentity do
  use DootTodo.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @primary_key {:provider, :string, autogenerate: false}
  @foreign_key_type Ecto.UUID

  schema "user_identities" do
    field :identity_data, :map
    field :last_sign_in_at, :utc_datetime_usec
    belongs_to :user, DootTodo.Users.User
    timestamps()
  end

  def changeset(identity, attrs) do
    identity
    |> cast(attrs, [:id, :provider, :user_id, :identity_data, :last_sign_in_at])
    |> validate_required([:id, :provider, :user_id, :identity_data, :last_sign_in_at])
  end
end
