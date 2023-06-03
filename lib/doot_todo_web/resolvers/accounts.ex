defmodule DootTodoWeb.Resolvers.Accounts do
  use Absinthe.Schema.Notation
  use DootTodo.Schema.AccountTypes
  use DootTodo.Schema.UserTypes
  alias DootTodo.Accounts
  alias DootTodo.Accounts.User

  def create_user(_parent, args, _context) do
    Accounts.register_user(args)
  end

  def login(%{email: email, password: password}, _info) do
    with %User{} = user <- Accounts.get_user_by_email_and_password(email, password),
         {:ok, jwt, _full_claims} <- DootTodo.Guardian.encode_and_sign(user) do
      {:ok, %{token: jwt}}
    else
      _ -> {:error, "Incorrect email or password"}
    end
  end

  object :login_result do
    field :token, :string
  end

  object :accounts_mutations do
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
