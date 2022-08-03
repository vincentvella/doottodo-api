defmodule Doottodo.Repo do
  use Ecto.Repo,
    otp_app: :doottodo,
    adapter: Ecto.Adapters.Postgres
end
