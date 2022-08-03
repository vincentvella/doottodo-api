defmodule DoottodoWeb.Resolvers.Lists do
  def list_lists(_parent, _args, _resolution) do
    {:ok, [%{id: "1", title: "test"}]}
  end
end
