defmodule DoottodoWeb.Schema.ListTypes do
  use Absinthe.Schema.Notation

  object :list do
    field :id, :id
    field :title, :string
  end
end
