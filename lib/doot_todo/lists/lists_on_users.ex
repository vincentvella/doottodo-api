defmodule DootTodo.Lists.ListOnUser do
  import Ecto.Changeset
  use Ecto.Schema

  @foreign_key_type Ecto.UUID

  schema "lists_on_users" do
    belongs_to :list, DootTodo.Lists.List, type: Ecto.UUID
    belongs_to :user, DootTodo.Users.User, type: Ecto.UUID
    timestamps()
  end

  def changeset(list_on_user, params \\ %{}) do
    list_on_user
    |> cast(params, [:list_id, :user_id])
    |> validate_required([:list_id, :user_id])
    |> unique_constraint([:list_id, :user_id])
  end
end
