defmodule DootTodo.ListsTest do
  use DootTodo.DataCase

  alias DootTodo.Lists

  describe "lists" do
    alias DootTodo.Lists.List

    import DootTodo.ListsFixtures

    @invalid_attrs %{id: nil, title: nil}

    test "list_lists/0 returns all lists" do
      list = list_fixture()
      assert Lists.list_lists() == [list]
    end

    test "get_list!/1 returns the list with given id" do
      list = list_fixture()
      assert Lists.get_list!(list.id) == list
    end

    test "create_list/1 with valid data creates a list" do
      valid_attrs = %{
        id: "7488a646-e31f-11e4-aace-600308960662",
        title: "some title"
      }

      assert {:ok, %List{} = list} = Lists.create_list(valid_attrs)
      assert list.id == "7488a646-e31f-11e4-aace-600308960662"
      assert list.title == "some title"
    end

    test "create_list/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Lists.create_list(@invalid_attrs)
    end

    test "update_list/2 with valid data updates the list" do
      list = list_fixture()

      update_attrs = %{
        id: "7488a646-e31f-11e4-aace-600308960668",
        title: "some updated title"
      }

      assert {:ok, %List{} = list} = Lists.update_list(list, update_attrs)
      assert list.id == "7488a646-e31f-11e4-aace-600308960668"
      assert list.title == "some updated title"
    end

    test "update_list/2 with invalid data returns error changeset" do
      list = list_fixture()
      assert {:error, %Ecto.Changeset{}} = Lists.update_list(list, @invalid_attrs)
      assert list == Lists.get_list!(list.id)
    end

    test "delete_list/1 deletes the list" do
      list = list_fixture()
      assert {:ok, %List{}} = Lists.delete_list(list)
      assert_raise Ecto.NoResultsError, fn -> Lists.get_list!(list.id) end
    end

    test "change_list/1 returns a list changeset" do
      list = list_fixture()
      assert %Ecto.Changeset{} = Lists.change_list(list)
    end
  end
end
