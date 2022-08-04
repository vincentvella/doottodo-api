defmodule DootTodo.UsersTest do
  use DootTodo.DataCase

  alias DootTodo.Users

  describe "users" do
    alias DootTodo.Users.User

    import DootTodo.UsersFixtures

    @invalid_attrs %{
      aud: nil,
      banned_until: nil,
      confirmation_sent_at: nil,
      confirmation_token: nil,
      confirmed_at: nil,
      email: nil,
      email_change: nil,
      email_change_confirm_status: nil,
      email_change_sent_at: nil,
      email_change_token_current: nil,
      email_change_token_new: nil,
      email_confirmed_at: nil,
      encrypted_password: nil,
      id: nil,
      invited_at: nil,
      is_super_admin: nil,
      last_sign_in_at: nil,
      phone: nil,
      phone_change: nil,
      phone_change_sent_at: nil,
      phone_change_token: nil,
      phone_confirmed_at: nil,
      raw_app_metadata: nil,
      raw_user_metadata: nil,
      reauthentication_sent_at: nil,
      reauthentication_token: nil,
      recovery_sent_at: nil,
      recovery_token: nil,
      role: nil
    }

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Users.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Users.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{
        aud: "some aud",
        banned_until: ~U[2022-08-03 05:55:00.000000Z],
        confirmation_sent_at: ~U[2022-08-03 05:55:00.000000Z],
        confirmation_token: "some confirmation_token",
        confirmed_at: ~U[2022-08-03 05:55:00.000000Z],
        email: "some email",
        email_change: "some email_change",
        email_change_confirm_status: 42,
        email_change_sent_at: ~U[2022-08-03 05:55:00.000000Z],
        email_change_token_current: "some email_change_token_current",
        email_change_token_new: "some email_change_token_new",
        email_confirmed_at: ~U[2022-08-03 05:55:00.000000Z],
        encrypted_password: "some encrypted_password",
        id: "7488a646-e31f-11e4-aace-600308960662",
        invited_at: ~U[2022-08-03 05:55:00.000000Z],
        is_super_admin: true,
        last_sign_in_at: ~U[2022-08-03 05:55:00.000000Z],
        phone: "some phone",
        phone_change: "some phone_change",
        phone_change_sent_at: ~U[2022-08-03 05:55:00.000000Z],
        phone_change_token: "some phone_change_token",
        phone_confirmed_at: ~U[2022-08-03 05:55:00.000000Z],
        raw_app_metadata: %{},
        raw_user_metadata: %{},
        reauthentication_sent_at: ~U[2022-08-03 05:55:00.000000Z],
        reauthentication_token: "some reauthentication_token",
        recovery_sent_at: ~U[2022-08-03 05:55:00.000000Z],
        recovery_token: "some recovery_token",
        role: "some role"
      }

      assert {:ok, %User{} = user} = Users.create_user(valid_attrs)
      assert user.aud == "some aud"
      assert user.banned_until == ~U[2022-08-03 05:55:00.000000Z]
      assert user.confirmation_sent_at == ~U[2022-08-03 05:55:00.000000Z]
      assert user.confirmation_token == "some confirmation_token"
      assert user.confirmed_at == ~U[2022-08-03 05:55:00.000000Z]
      assert user.email == "some email"
      assert user.email_change == "some email_change"
      assert user.email_change_confirm_status == 42
      assert user.email_change_sent_at == ~U[2022-08-03 05:55:00.000000Z]
      assert user.email_change_token_current == "some email_change_token_current"
      assert user.email_change_token_new == "some email_change_token_new"
      assert user.email_confirmed_at == ~U[2022-08-03 05:55:00.000000Z]
      assert user.encrypted_password == "some encrypted_password"
      assert user.id == "7488a646-e31f-11e4-aace-600308960662"
      assert user.invited_at == ~U[2022-08-03 05:55:00.000000Z]
      assert user.is_super_admin == true
      assert user.last_sign_in_at == ~U[2022-08-03 05:55:00.000000Z]
      assert user.phone == "some phone"
      assert user.phone_change == "some phone_change"
      assert user.phone_change_sent_at == ~U[2022-08-03 05:55:00.000000Z]
      assert user.phone_change_token == "some phone_change_token"
      assert user.phone_confirmed_at == ~U[2022-08-03 05:55:00.000000Z]
      assert user.raw_app_metadata == %{}
      assert user.raw_user_metadata == %{}
      assert user.reauthentication_sent_at == ~U[2022-08-03 05:55:00.000000Z]
      assert user.reauthentication_token == "some reauthentication_token"
      assert user.recovery_sent_at == ~U[2022-08-03 05:55:00.000000Z]
      assert user.recovery_token == "some recovery_token"
      assert user.role == "some role"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Users.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()

      update_attrs = %{
        aud: "some updated aud",
        banned_until: ~U[2022-08-04 05:55:00.000000Z],
        confirmation_sent_at: ~U[2022-08-04 05:55:00.000000Z],
        confirmation_token: "some updated confirmation_token",
        confirmed_at: ~U[2022-08-04 05:55:00.000000Z],
        email: "some updated email",
        email_change: "some updated email_change",
        email_change_confirm_status: 43,
        email_change_sent_at: ~U[2022-08-04 05:55:00.000000Z],
        email_change_token_current: "some updated email_change_token_current",
        email_change_token_new: "some updated email_change_token_new",
        email_confirmed_at: ~U[2022-08-04 05:55:00.000000Z],
        encrypted_password: "some updated encrypted_password",
        id: "7488a646-e31f-11e4-aace-600308960668",
        invited_at: ~U[2022-08-04 05:55:00.000000Z],
        is_super_admin: false,
        last_sign_in_at: ~U[2022-08-04 05:55:00.000000Z],
        phone: "some updated phone",
        phone_change: "some updated phone_change",
        phone_change_sent_at: ~U[2022-08-04 05:55:00.000000Z],
        phone_change_token: "some updated phone_change_token",
        phone_confirmed_at: ~U[2022-08-04 05:55:00.000000Z],
        raw_app_metadata: %{},
        raw_user_metadata: %{},
        reauthentication_sent_at: ~U[2022-08-04 05:55:00.000000Z],
        reauthentication_token: "some updated reauthentication_token",
        recovery_sent_at: ~U[2022-08-04 05:55:00.000000Z],
        recovery_token: "some updated recovery_token",
        role: "some updated role"
      }

      assert {:ok, %User{} = user} = Users.update_user(user, update_attrs)
      assert user.aud == "some updated aud"
      assert user.banned_until == ~U[2022-08-04 05:55:00.000000Z]
      assert user.confirmation_sent_at == ~U[2022-08-04 05:55:00.000000Z]
      assert user.confirmation_token == "some updated confirmation_token"
      assert user.confirmed_at == ~U[2022-08-04 05:55:00.000000Z]
      assert user.email == "some updated email"
      assert user.email_change == "some updated email_change"
      assert user.email_change_confirm_status == 43
      assert user.email_change_sent_at == ~U[2022-08-04 05:55:00.000000Z]
      assert user.email_change_token_current == "some updated email_change_token_current"
      assert user.email_change_token_new == "some updated email_change_token_new"
      assert user.email_confirmed_at == ~U[2022-08-04 05:55:00.000000Z]
      assert user.encrypted_password == "some updated encrypted_password"
      assert user.id == "7488a646-e31f-11e4-aace-600308960668"
      assert user.invited_at == ~U[2022-08-04 05:55:00.000000Z]
      assert user.is_super_admin == false
      assert user.last_sign_in_at == ~U[2022-08-04 05:55:00.000000Z]
      assert user.phone == "some updated phone"
      assert user.phone_change == "some updated phone_change"
      assert user.phone_change_sent_at == ~U[2022-08-04 05:55:00.000000Z]
      assert user.phone_change_token == "some updated phone_change_token"
      assert user.phone_confirmed_at == ~U[2022-08-04 05:55:00.000000Z]
      assert user.raw_app_metadata == %{}
      assert user.raw_user_metadata == %{}
      assert user.reauthentication_sent_at == ~U[2022-08-04 05:55:00.000000Z]
      assert user.reauthentication_token == "some updated reauthentication_token"
      assert user.recovery_sent_at == ~U[2022-08-04 05:55:00.000000Z]
      assert user.recovery_token == "some updated recovery_token"
      assert user.role == "some updated role"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Users.update_user(user, @invalid_attrs)
      assert user == Users.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Users.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Users.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Users.change_user(user)
    end
  end
end
