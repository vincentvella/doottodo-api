defmodule DootTodo.Schema.AccountTypes do
  defmacro __using__(_opts) do
    quote do
      object :account do
        field :id, non_null(:id)
        field :user_id, :string
        field :invited_at, :datetime
        field :confirmation_token, :string
        field :confirmation_sent_at, :string
        field :confirmed_at, :datetime
        field :recovery_token, :string
        field :recovery_sent_at, :datetime
        field :recovery_confirmed_at, :datetime
        field :email_confirmed_at, :datetime
        field :email_change_token_new, :string
        field :email_change, :string
        field :email_change_sent_at, :datetime
        field :last_sign_in_at, :datetime
        field :phone, :string
        field :phone_confirmed_at, :datetime
        field :phone_change, :string
        field :phone_change_token, :string
        field :phone_change_sent_at, :string
        field :phone_change_token_current, :string
        field :phone_change_confirm_status, :integer
        field :banned_until, :datetime
        field :reauthentication_token, :string
        field :reauthentication_sent_at, :datetime
      end
    end
  end
end
