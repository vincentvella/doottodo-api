defmodule DootTodo.Guardian do
  @moduledoc """
  Implementation module for Guardian and functions for authentication.
  """
  use Guardian, otp_app: :doot_todo

  alias DootTodo.Users

  def subject_for_token(resource, _claims) do
    {:ok, to_string(resource.id)}
  end

  def resource_from_claims(%{"sub" => id}) do
    case Users.UsersController.get_user!(id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
