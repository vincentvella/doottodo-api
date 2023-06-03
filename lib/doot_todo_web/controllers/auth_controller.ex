defmodule DootTodoWeb.AuthController do
  use DootTodoWeb, :controller
  plug Ueberauth

  def request(conn, _params) do
    # Present an authentication challenge to the user
  end

  def callback(%{assigns: %{ueberauth_auth: auth_data}} = conn, _params) do
    # Find the account if it exists or create it if it doesn't
  end

  def callback(%{assigns: %{ueberauth_failure: _}} = conn, _params) do
    # Tell the user something went wrong
  end

  def identity_callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    #   case User.validate_password(auth.credentials) do
    #     :ok ->
    #       user = %{id: auth.uid, name: name_from_auth(auth), avatar: auth.info.image}

    #       conn
    #       |> put_flash(:info, "Successfully authenticated.")
    #       |> put_session(:current_user, user)
    #       |> redirect(to: "/")

    #     {:error, reason} ->
    #       conn
    #       |> put_flash(:error, reason)
    #       |> redirect(to: "/")
    #   endj
  end
end
