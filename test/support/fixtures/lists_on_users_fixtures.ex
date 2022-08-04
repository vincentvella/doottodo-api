defmodule DootTodo.ListsOnUsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DootTodo.ListsOnUsers` context.
  """

  @doc """
  Generate a list_on_user.
  """
  def list_on_user_fixture(attrs \\ %{}) do
    {:ok, list_on_user} =
      attrs
      |> Enum.into(%{
        list_id: "7488a646-e31f-11e4-aace-600308960662",
        user_id: "7488a646-e31f-11e4-aace-600308960662"
      })
      |> DootTodo.ListsOnUsers.create_list_on_user()

    list_on_user
  end
end
