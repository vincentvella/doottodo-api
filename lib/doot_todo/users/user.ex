defmodule DootTodo.Users.User do
  use DootTodo.Schema

  @primary_key {:id, Ecto.UUID, autogenerate: true}

  schema "users" do
    field :email, :string
    field :password, :string, virtual: true, redact: true
    field :password_hash, :string, redact: true
    timestamps()
  end
end
