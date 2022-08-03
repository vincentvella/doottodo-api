defmodule DoottodoWeb.Schema do
  use Absinthe.Schema
  import_types DoottodoWeb.Schema.ListTypes

  alias DoottodoWeb.Resolvers

  query do
    @desc "Get Lists"
    field :lists, list_of(:list) do
      resolve &Resolvers.Lists.list_lists/3
    end
  end
end
