defmodule DootTodo.ListsOnUsersTest do
  use DootTodo.DataCase

  alias DootTodo.ListsOnUsers

  describe "lists_on_users" do
    alias DootTodo.ListsOnUsers.ListOnUser

    import DootTodo.ListsOnUsersFixtures

    @invalid_attrs %{list_id: nil, user_id: nil}

    test "list_lists_on_users/0 returns all lists_on_users" do
      list_on_user = list_on_user_fixture()
      assert ListsOnUsers.list_lists_on_users() == [list_on_user]
    end

    test "get_list_on_user!/1 returns the list_on_user with given id" do
      list_on_user = list_on_user_fixture()
      assert ListsOnUsers.get_list_on_user!(list_on_user.id) == list_on_user
    end

    test "create_list_on_user/1 with valid data creates a list_on_user" do
      valid_attrs = %{
        list_id: "7488a646-e31f-11e4-aace-600308960662",
        user_id: "7488a646-e31f-11e4-aace-600308960662"
      }

      assert {:ok, %ListOnUser{} = list_on_user} = ListsOnUsers.create_list_on_user(valid_attrs)
      assert list_on_user.list_id == "7488a646-e31f-11e4-aace-600308960662"
      assert list_on_user.user_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_list_on_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = ListsOnUsers.create_list_on_user(@invalid_attrs)
    end

    test "update_list_on_user/2 with valid data updates the list_on_user" do
      list_on_user = list_on_user_fixture()

      update_attrs = %{
        list_id: "7488a646-e31f-11e4-aace-600308960668",
        user_id: "7488a646-e31f-11e4-aace-600308960668"
      }

      assert {:ok, %ListOnUser{} = list_on_user} =
               ListsOnUsers.update_list_on_user(list_on_user, update_attrs)

      assert list_on_user.list_id == "7488a646-e31f-11e4-aace-600308960668"
      assert list_on_user.user_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_list_on_user/2 with invalid data returns error changeset" do
      list_on_user = list_on_user_fixture()

      assert {:error, %Ecto.Changeset{}} =
               ListsOnUsers.update_list_on_user(list_on_user, @invalid_attrs)

      assert list_on_user == ListsOnUsers.get_list_on_user!(list_on_user.id)
    end

    test "delete_list_on_user/1 deletes the list_on_user" do
      list_on_user = list_on_user_fixture()
      assert {:ok, %ListOnUser{}} = ListsOnUsers.delete_list_on_user(list_on_user)
      assert_raise Ecto.NoResultsError, fn -> ListsOnUsers.get_list_on_user!(list_on_user.id) end
    end

    test "change_list_on_user/1 returns a list_on_user changeset" do
      list_on_user = list_on_user_fixture()
      assert %Ecto.Changeset{} = ListsOnUsers.change_list_on_user(list_on_user)
    end
  end
end
