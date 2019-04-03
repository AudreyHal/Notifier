defmodule Notifier.Organization do
  import Ecto.Query, warn: false
  alias Notifier.Repo
  alias Notifier.Organization.User
  alias Notifier.Organization.Memo


  def list_users do
    Repo.all(User)
  end

  def get_user!(id), do: Repo.get!(User, id)

  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  def list_memos do
    Repo.all(Memo)
  end

  def get_memo!(id), do: Repo.get!(Memo, id)

  def create_memo(attrs \\ %{}) do
    %Memo{}
    |> Memo.changeset(attrs)
    |> Repo.insert()
  end

  def update_memo(%Memo{} = memo, attrs) do
    memo
    |> Memo.changeset(attrs)
    |> Repo.update()
  end

  def delete_memo(%Memo{} = memo) do
    Repo.delete(memo)
  end

  def change_memo(%Memo{} = memo) do
    Memo.changeset(memo, %{})
  end
end
