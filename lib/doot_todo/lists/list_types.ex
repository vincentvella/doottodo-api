defmodule DootTodo.Schema.ListTypes do
  defmacro __using__(_opts) do
    quote do
      object :list do
        field :id, non_null(:id)
        field :title, non_null(:string)
        field :inserted_at, non_null(:datetime)
        field :updated_at, non_null(:datetime)
      end
    end
  end
end
