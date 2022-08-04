defmodule DootTodo.ListsOnUsers do
  @moduledoc """
  The ListsOnUsers context.
  """

  import Ecto.Query, warn: false
  alias DootTodo.Repo

  alias DootTodo.ListsOnUsers.ListOnUser

  @doc """
  Returns the list of lists_on_users.

  ## Examples

      iex> list_lists_on_users()
      [%ListOnUser{}, ...]

  """
  def list_lists_on_users do
    Repo.all(ListOnUser)
  end

  @doc """
  Gets a single list_on_user.

  Raises `Ecto.NoResultsError` if the List on user does not exist.

  ## Examples

      iex> get_list_on_user!(123)
      %ListOnUser{}

      iex> get_list_on_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_list_on_user!(id), do: Repo.get!(ListOnUser, id)

  @doc """
  Creates a list_on_user.

  ## Examples

      iex> create_list_on_user(%{field: value})
      {:ok, %ListOnUser{}}

      iex> create_list_on_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_list_on_user(attrs \\ %{}) do
    %ListOnUser{}
    |> ListOnUser.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a list_on_user.

  ## Examples

      iex> update_list_on_user(list_on_user, %{field: new_value})
      {:ok, %ListOnUser{}}

      iex> update_list_on_user(list_on_user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_list_on_user(%ListOnUser{} = list_on_user, attrs) do
    list_on_user
    |> ListOnUser.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a list_on_user.

  ## Examples

      iex> delete_list_on_user(list_on_user)
      {:ok, %ListOnUser{}}

      iex> delete_list_on_user(list_on_user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_list_on_user(%ListOnUser{} = list_on_user) do
    Repo.delete(list_on_user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking list_on_user changes.

  ## Examples

      iex> change_list_on_user(list_on_user)
      %Ecto.Changeset{data: %ListOnUser{}}

  """
  def change_list_on_user(%ListOnUser{} = list_on_user, attrs \\ %{}) do
    ListOnUser.changeset(list_on_user, attrs)
  end
end
