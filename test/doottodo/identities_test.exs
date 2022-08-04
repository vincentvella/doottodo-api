defmodule DootTodo.IdentitiesTest do
  use DootTodo.DataCase

  alias DootTodo.Identities

  describe "identities" do
    alias DootTodo.Identities.Identity

    import DootTodo.IdentitiesFixtures

    @invalid_attrs %{
      id: nil,
      identity_data: nil,
      last_sign_in_at: nil,
      provider: nil,
      user_id: nil
    }

    test "list_identities/0 returns all identities" do
      identity = identity_fixture()
      assert Identities.list_identities() == [identity]
    end

    test "get_identity!/1 returns the identity with given id" do
      identity = identity_fixture()
      assert Identities.get_identity!(identity.id) == identity
    end

    test "create_identity/1 with valid data creates a identity" do
      valid_attrs = %{
        id: "7488a646-e31f-11e4-aace-600308960662",
        identity_data: %{},
        last_sign_in_at: ~U[2022-08-03 03:51:00.000000Z],
        provider: "some provider",
        user_id: "7488a646-e31f-11e4-aace-600308960662"
      }

      assert {:ok, %Identity{} = identity} = Identities.create_identity(valid_attrs)
      assert identity.id == "7488a646-e31f-11e4-aace-600308960662"
      assert identity.identity_data == %{}
      assert identity.last_sign_in_at == ~U[2022-08-03 03:51:00.000000Z]
      assert identity.provider == "some provider"
      assert identity.user_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_identity/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Identities.create_identity(@invalid_attrs)
    end

    test "update_identity/2 with valid data updates the identity" do
      identity = identity_fixture()

      update_attrs = %{
        id: "7488a646-e31f-11e4-aace-600308960668",
        identity_data: %{},
        last_sign_in_at: ~U[2022-08-04 03:51:00.000000Z],
        provider: "some updated provider",
        user_id: "7488a646-e31f-11e4-aace-600308960668"
      }

      assert {:ok, %Identity{} = identity} = Identities.update_identity(identity, update_attrs)
      assert identity.id == "7488a646-e31f-11e4-aace-600308960668"
      assert identity.identity_data == %{}
      assert identity.last_sign_in_at == ~U[2022-08-04 03:51:00.000000Z]
      assert identity.provider == "some updated provider"
      assert identity.user_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_identity/2 with invalid data returns error changeset" do
      identity = identity_fixture()
      assert {:error, %Ecto.Changeset{}} = Identities.update_identity(identity, @invalid_attrs)
      assert identity == Identities.get_identity!(identity.id)
    end

    test "delete_identity/1 deletes the identity" do
      identity = identity_fixture()
      assert {:ok, %Identity{}} = Identities.delete_identity(identity)
      assert_raise Ecto.NoResultsError, fn -> Identities.get_identity!(identity.id) end
    end

    test "change_identity/1 returns a identity changeset" do
      identity = identity_fixture()
      assert %Ecto.Changeset{} = Identities.change_identity(identity)
    end
  end
end
