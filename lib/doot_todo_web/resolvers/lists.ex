defmodule DootTodoWeb.Resolvers.Lists do
  use Absinthe.Schema.Notation
  import_types(Absinthe.Type.Custom)
  use DootTodo.Schema.ListTypes

  alias DootTodo.Lists

  object :lists_queries do
    @desc "Get Lists"
    # [List!]!
    field :lists, non_null(list_of(non_null(:list))) do
      resolve(&list_lists/3)
    end
  end

  def list_lists(_parent, _args, _resolution) do
    {:ok, Lists.list_lists()}
  end

  def create_list(_parent, args, _resolution) do
    case Lists.create_list(%{title: args[:title]}) do
      {:ok, %Lists.List{}} ->
        {:ok, true}

      _ ->
        {:ok, false}
    end
  end
end
