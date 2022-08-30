defmodule DootTodo.Identities.IdentitiesController do
  import Ecto.Changeset

  alias DootTodo.Repo
  alias DootTodo.Identities.Identity

  def identity_changeset(identity, opts) do
    identity
    |> change(user_id: Ecto.UUID.cast!(opts[:user_id]))
    |> cast_assoc(:user)
    |> change(opts)
    |> validate_required([:user_id, :provider])
  end

  def create_identity(opts) do
    %Identity{}
    |> identity_changeset(opts)
    |> Repo.insert()
  end
end
