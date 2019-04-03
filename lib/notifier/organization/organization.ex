defmodule Notifier.Organization do
  @moduledoc """
  The Organization context.
  """

  import Ecto.Query, warn: false
  alias Notifier.Repo

  alias Notifier.Organization.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a User.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias Notifier.Organization.Memo

  @doc """
  Returns the list of memos.

  ## Examples

      iex> list_memos()
      [%Memo{}, ...]

  """
  def list_memos do
    Repo.all(Memo)
  end

  @doc """
  Gets a single memo.

  Raises `Ecto.NoResultsError` if the Memo does not exist.

  ## Examples

      iex> get_memo!(123)
      %Memo{}

      iex> get_memo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_memo!(id), do: Repo.get!(Memo, id)

  @doc """
  Creates a memo.

  ## Examples

      iex> create_memo(%{field: value})
      {:ok, %Memo{}}

      iex> create_memo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_memo(attrs \\ %{}) do
    %Memo{}
    |> Memo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a memo.

  ## Examples

      iex> update_memo(memo, %{field: new_value})
      {:ok, %Memo{}}

      iex> update_memo(memo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_memo(%Memo{} = memo, attrs) do
    memo
    |> Memo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Memo.

  ## Examples

      iex> delete_memo(memo)
      {:ok, %Memo{}}

      iex> delete_memo(memo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_memo(%Memo{} = memo) do
    Repo.delete(memo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking memo changes.

  ## Examples

      iex> change_memo(memo)
      %Ecto.Changeset{source: %Memo{}}

  """
  def change_memo(%Memo{} = memo) do
    Memo.changeset(memo, %{})
  end
end
