defmodule DootTodo.IdentitiesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DootTodo.Identities` context.
  """

  @doc """
  Generate a identity.
  """
  def identity_fixture(attrs \\ %{}) do
    {:ok, identity} =
      attrs
      |> Enum.into(%{
        id: "7488a646-e31f-11e4-aace-600308960662",
        identity_data: %{},
        last_sign_in_at: ~U[2022-08-03 03:51:00.000000Z],
        provider: "some provider",
        user_id: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> DootTodo.Identities.create_identity()

    identity
  end
end
