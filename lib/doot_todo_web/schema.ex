defmodule DootTodoWeb.Schema do
  use Absinthe.Schema
  alias DootTodoWeb.Resolvers

  # Add import type here
  import_types(Resolvers.Lists)
  import_types(Resolvers.Accounts)

  query do
    # Add queries here
    import_fields(:lists_queries)
  end

  mutation do
    import_fields(:accounts_mutations)
    # Add mutations here. Example
    # import_fields(:create_product)
    # THESE CAN BE UNCOMMENTED WHEN THERE IS A QUERY
    # import_fields(:login_mutation)
    # import_fields(:create_user_mutation)
  end
end
