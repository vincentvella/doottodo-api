defmodule DootTodo.GraphQL.Middleware.ErrorHandler do
  alias DootTodo.Utils.Error
  @behaviour Absinthe.Middleware

  @impl true
  def call(resolution, _config) do
    errors =
      resolution.errors
      |> Enum.map(&DootTodo.Utils.Error.normalize/1)
      |> List.flatten()
      |> Enum.map(&to_absinthe_format/1)

    %{resolution | errors: errors}
  end

  defp to_absinthe_format(%Error{} = error), do: Map.from_struct(error)
  defp to_absinthe_format(error), do: error
end
