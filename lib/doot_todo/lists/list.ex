defmodule DootTodo.Lists.List do
  import Ecto.Changeset
  use DootTodo.Schema

  schema "lists" do
    field(:title, :string)
    has_many(:users, DootTodo.Lists.ListOnUser)
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:id, :title])
    |> validate_required([:title])
  end
end
