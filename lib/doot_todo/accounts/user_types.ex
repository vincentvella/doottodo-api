defmodule DootTodo.Schema.UserTypes do
  defmacro __using__(_opts) do
    quote do
      alias DootTodoWeb.Resolvers

      @desc "A user"
      object :user do
        field :id, non_null(:id)
        field :email, :string
        field :confirmed_at, :datetime
        field :avatar, :string
      end

      object :create_user_mutation do
        @desc """
        create user
        """

        @desc "Create a user"
        field :create_user, :user do
          arg(:email, non_null(:string))
          arg(:password, non_null(:string))

          resolve(&Resolvers.Accounts.create_user/3)
        end
      end

      object :login_mutation do
        @desc """
        login with the params
        """

        field :create_session, :session do
          arg(:email, non_null(:string))
          arg(:password, non_null(:string))
          resolve(&Resolvers.Accounts.login/2)
        end
      end

      @desc "session value"
      object :session do
        field(:token, :string)
        field(:user, :user)
      end
    end
  end
end
