defmodule DootTodoWeb.Schema do
  use Absinthe.Schema
  alias DootTodoWeb.Resolvers

  # Add import type here
  import_types(Resolvers.Lists)
  import_types(Resolvers.Users)

  query do
    # Add queries here
    import_fields(:lists_queries)
  end

  mutation do
    import_fields(:users_mutations)
    # Add mutations here. Example
    # import_fields(:create_product)
  end
end
