defmodule DootTodoWeb.Schema do
  use Absinthe.Schema
  import DootTodo.Schema.Account
  import DootTodo.Schema.Identity
  import DootTodo.Schema.List
  import DootTodo.Schema.User
  alias DootTodo.GraphQL.Middleware.{ErrorHandler, SafeResolution}
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

  def middleware(middleware, _field, %{identifier: type}) when type in [:query, :mutation] do
    SafeResolution.apply(middleware) ++ [ErrorHandler]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end
end
