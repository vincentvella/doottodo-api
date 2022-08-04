defmodule DoottodoWeb.Resolvers.Lists do
  alias Doottodo.Lists

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
