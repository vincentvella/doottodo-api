defmodule DootTodo.RefreshTokensFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DootTodo.RefreshTokens` context.
  """

  @doc """
  Generate a refresh_token.
  """
  def refresh_token_fixture(attrs \\ %{}) do
    {:ok, refresh_token} =
      attrs
      |> Enum.into(%{
        id: 42,
        parent: "some parent",
        revoked: true,
        token: "some token",
        user_id: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> DootTodo.RefreshTokens.create_refresh_token()

    refresh_token
  end
end
