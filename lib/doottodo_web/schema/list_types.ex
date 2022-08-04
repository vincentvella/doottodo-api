defmodule DootTodoWeb.Schema.ListTypes do
  use Absinthe.Schema.Notation

  import_types(Absinthe.Type.Custom)

  object :list do
    field :id, non_null(:id)
    field :title, non_null(:string)
    field :inserted_at, non_null(:datetime)
    field :updated_at, non_null(:datetime)
  end
end
