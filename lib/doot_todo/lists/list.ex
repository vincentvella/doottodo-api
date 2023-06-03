defmodule DootTodo.Lists.List do
  use DootTodo.Schema
  import Ecto.Changeset

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "lists" do
    field(:title, :string)
    many_to_many :users, DootTodo.Accounts.User, join_through: DootTodo.ListsOnUsers.ListOnUser
    timestamps()
  end

  @doc false
  def changeset(list, attrs) do
    list
    |> cast(attrs, [:id, :title, :inserted_at, :updated_at])
    |> validate_required([:title])
  end
end