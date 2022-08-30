defmodule DootTodoWeb.Resolvers.Users do
  alias DootTodo.Repo
  use Absinthe.Schema.Notation
  use DootTodo.Schema.User
  alias DootTodo.Users.User
  alias DootTodo.Accounts.Account
  alias DootTodo.Identities.Identity
  alias DootTodo.Users.UsersController
  alias DootTodo.Accounts.AccountsController
  alias DootTodo.Identities.IdentitiesController

  def create_user(_parent, args, _context) do
    user_changeset =
      UsersController.registration_changeset(%User{:id => Ecto.UUID.generate()}, args)

    account_changeset = AccountsController.account_changeset(%Account{}, user_changeset.data.id)

    identity_id = Ecto.UUID.generate()

    identity_changeset =
      IdentitiesController.identity_changeset(%Identity{:id => identity_id}, %{
        user_id: user_changeset.data.id,
        identity_data: %{sub: identity_id},
        provider: "email"
      })

    # list_changeset = ListsController.list_changeset(%List{}, user_changeset.data.id)

    Ecto.Multi.new()
    |> Ecto.Multi.insert(:user, user_changeset)
    |> Ecto.Multi.insert(:account, account_changeset)
    |> Ecto.Multi.insert(:identity, identity_changeset)
    # |> Ecto.Multi.insert(:lists, lists_changeset)
    |> Repo.transaction()
    |> case do
      {:ok, %{user: user, account: _account}} ->
        # We only return the user here, frontend doesn't need any acct info
        {:ok, user}

      {:error, :user, value, _} ->
        IO.puts("User registration failed")
        IO.inspect(value)

      {:error, op, value, _} ->
        IO.puts("Unknown Error in user registration")
        IO.inspect(op)
        IO.inspect(value)
    end
  end

  #       {:error, changeset} ->
  #         {:error, changeset}
  #     end

  #   {:error, changeset} ->
  #     {:error, changeset}
  # end

  @spec login(%{:email => any, :password => any, optional(any) => any}, any) ::
          {:error, <<_::216>>} | {:ok, %{token: binary}}
  def login(%{email: email, password: password}, _info) do
    with %User{} = user <- UsersController.get_user_by_email_and_password(email, password),
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
    field :create_user, non_null(:user) do
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
