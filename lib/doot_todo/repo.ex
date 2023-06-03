defmodule DootTodo.Repo do
  use Ecto.Repo,
    otp_app: :doot_todo,
    adapter: Ecto.Adapters.Postgres
end
