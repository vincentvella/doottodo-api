defmodule DootTodoWeb.AuthAccessPipeline do
  use Guardian.Plug.Pipeline, otp_app: :doot_todo

  plug Guardian.Plug.VerifyHeader, claims: %{"typ" => "access"}
  plug Guardian.Plug.EnsureAuthenticated
  plug Guardian.Plug.LoadResource, allow_blank: true
end
