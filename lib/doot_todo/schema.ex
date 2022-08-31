defmodule DootTodo.Schema do
  defmacro __using__(_) do
    quote do
      use Ecto.Schema
      @primary_key {:id, Ecto.UUID, autogenerate: true}
      @foreign_key_type Ecto.UUID
      @derive {Phoenix.Param, key: :id}
      @timestamps_opts [type: :utc_datetime_usec]
    end
  end
end
