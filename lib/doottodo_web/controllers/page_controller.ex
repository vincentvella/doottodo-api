defmodule DoottodoWeb.PageController do
  use DoottodoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
