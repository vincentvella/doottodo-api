defmodule DootTodo.Identities.Identity do
  use Ecto.Schema
  alias DootTodo.Users.User

  @primary_key {:user_id, Ecto.UUID, autogenerate: true}
  @primary_key {:provider, :string, autogenerate: false}
  @foreign_key_type :binary_id
  @derive {Phoenix.Param, key: :user_id}
  @timestamps_opts [type: :utc_datetime_usec]

  schema "identities" do
    field :id, Ecto.UUID, autogenerate: true
    field :identity_data, :map
    field :last_sign_in_at, :utc_datetime_usec
    belongs_to :user, User, type: Ecto.UUID
    timestamps()
  end
end
