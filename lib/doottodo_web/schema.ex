defmodule DootTodoWeb.Schema do
  use Absinthe.Schema

  import_types(DootTodoWeb.Schema.ListTypes)

  alias DootTodoWeb.Resolvers

  mutation do
    field :create_list, non_null(:boolean) do
      arg(:title, non_null(:string))
      resolve(&Resolvers.Lists.create_list/3)
    end
  end

  query do
    @desc "Get Lists"
    # [List!]!
    field :lists, non_null(list_of(non_null(:list))) do
      resolve(&Resolvers.Lists.list_lists/3)
    end
  end
end
