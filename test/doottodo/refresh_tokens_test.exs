defmodule DootTodo.RefreshTokensTest do
  use DootTodo.DataCase

  alias DootTodo.RefreshTokens

  describe "refresh_tokens" do
    alias DootTodo.RefreshTokens.RefreshToken

    import DootTodo.RefreshTokensFixtures

    @invalid_attrs %{id: nil, parent: nil, revoked: nil, token: nil, user_id: nil}

    test "list_refresh_tokens/0 returns all refresh_tokens" do
      refresh_token = refresh_token_fixture()
      assert RefreshTokens.list_refresh_tokens() == [refresh_token]
    end

    test "get_refresh_token!/1 returns the refresh_token with given id" do
      refresh_token = refresh_token_fixture()
      assert RefreshTokens.get_refresh_token!(refresh_token.id) == refresh_token
    end

    test "create_refresh_token/1 with valid data creates a refresh_token" do
      valid_attrs = %{
        id: 42,
        parent: "some parent",
        revoked: true,
        token: "some token",
        user_id: "7488a646-e31f-11e4-aace-600308960662"
      }

      assert {:ok, %RefreshToken{} = refresh_token} =
               RefreshTokens.create_refresh_token(valid_attrs)

      assert refresh_token.id == 42
      assert refresh_token.parent == "some parent"
      assert refresh_token.revoked == true
      assert refresh_token.token == "some token"
      assert refresh_token.user_id == "7488a646-e31f-11e4-aace-600308960662"
    end

    test "create_refresh_token/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = RefreshTokens.create_refresh_token(@invalid_attrs)
    end

    test "update_refresh_token/2 with valid data updates the refresh_token" do
      refresh_token = refresh_token_fixture()

      update_attrs = %{
        id: 43,
        parent: "some updated parent",
        revoked: false,
        token: "some updated token",
        user_id: "7488a646-e31f-11e4-aace-600308960668"
      }

      assert {:ok, %RefreshToken{} = refresh_token} =
               RefreshTokens.update_refresh_token(refresh_token, update_attrs)

      assert refresh_token.id == 43
      assert refresh_token.parent == "some updated parent"
      assert refresh_token.revoked == false
      assert refresh_token.token == "some updated token"
      assert refresh_token.user_id == "7488a646-e31f-11e4-aace-600308960668"
    end

    test "update_refresh_token/2 with invalid data returns error changeset" do
      refresh_token = refresh_token_fixture()

      assert {:error, %Ecto.Changeset{}} =
               RefreshTokens.update_refresh_token(refresh_token, @invalid_attrs)

      assert refresh_token == RefreshTokens.get_refresh_token!(refresh_token.id)
    end

    test "delete_refresh_token/1 deletes the refresh_token" do
      refresh_token = refresh_token_fixture()
      assert {:ok, %RefreshToken{}} = RefreshTokens.delete_refresh_token(refresh_token)

      assert_raise Ecto.NoResultsError, fn ->
        RefreshTokens.get_refresh_token!(refresh_token.id)
      end
    end

    test "change_refresh_token/1 returns a refresh_token changeset" do
      refresh_token = refresh_token_fixture()
      assert %Ecto.Changeset{} = RefreshTokens.change_refresh_token(refresh_token)
    end
  end
end
