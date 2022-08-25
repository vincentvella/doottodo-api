defmodule DootTodoWeb.FallbackController do
  use DootTodoWeb, :controller

  def call(conn, error) do
    errors =
      error
      |> DootTodo.Utils.Error.normalize()
      |> List.wrap()

    status = hd(errors).status_code
    messages = Enum.map(errors, & &1.message)

    conn
    |> put_status(status)
    |> json(%{errors: messages})
  end
end
