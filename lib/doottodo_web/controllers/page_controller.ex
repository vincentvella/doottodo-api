defmodule DootTodoWeb.PageController do
  use DootTodoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
