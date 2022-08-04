defmodule DootTodo.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `DootTodo.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
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
      })
      |> DootTodo.Users.create_user()

    user
  end
end
