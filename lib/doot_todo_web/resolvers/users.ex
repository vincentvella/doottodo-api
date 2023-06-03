defmodule DootTodoWeb.Resolvers.Users do
  use Absinthe.Schema.Notation
  alias DootTodo.Users
  alias DootTodo.Accounts

  def create_user(parent, args, context) do
    Users.User.registration_changeset(parent, args, context)
  end

  @spec login(%{:email => any, :password => any, optional(any) => any}, any) ::
          {:error, <<_::216>>} | {:ok, %{token: binary}}
  def login(%{email: email, password: password}, _info) do
    with %Users.User{} = user <- Accounts.get_user_by_email_and_password(email, password),
         {:ok, jwt, _full_claims} <- DootTodo.Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt}}
    else
      _ -> {:error, "Incorrect email or password"}
    end
  end

  object :login_result do
    field :token, :string
  end

  object :users_mutations do
    field :create_user, non_null(:account) do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&create_user/3)
    end

    field :login, non_null(:login_result) do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      resolve(&login/2)
    end
  end
end