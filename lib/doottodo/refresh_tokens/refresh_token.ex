defmodule DootTodo.RefreshTokens.RefreshToken do
  use DootTodo.Schema
  import Ecto.Changeset

  schema "refresh_tokens" do
    field :token, :string
    field :revoked, :boolean, default: false
    field :parent, :string
    belongs_to :user, DootTodo.Users.User
    timestamps()
  end

  @doc false
  def changeset(refresh_token, attrs) do
    refresh_token
    |> cast(attrs, [:id, :token, :user_id, :revoked, :parent])
    |> validate_required([:id, :token, :user_id, :revoked, :parent])
  end
end
