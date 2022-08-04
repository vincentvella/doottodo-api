defmodule Doottodo.ListsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Doottodo.Lists` context.
  """

  @doc """
  Generate a list.
  """
  def list_fixture(attrs \\ %{}) do
    {:ok, list} =
      attrs
      |> Enum.into(%{
        id: "7488a646-e31f-11e4-aace-600308960662",
        title: "some title"
      })
      |> Doottodo.Lists.create_list()

    list
  end
end