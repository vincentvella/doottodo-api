defmodule DootTodo.Users.User do
  import Ecto.Changeset
  use DootTodo.Schema

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true, redact: true
    field :password_hash, :string, redact: true
    has_many(:lists, DootTodo.Lists.ListOnUser)
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :password_hash])
    |> unique_constraint(:email)
  end
end
