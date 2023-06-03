defmodule DootTodo.ListsOnUsers.ListOnUser do
  use DootTodo.Schema
  import Ecto.Changeset

  @primary_key false
  schema "lists_on_users" do
    belongs_to :user, DootTodo.Accounts.User
    belongs_to :list, DootTodo.Lists.List
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:user_id, :list_id])
    |> validate_required([:user_id, :list_id])
  end
end
