defmodule Notifier.Organization do
  import Ecto.Query, warn: false
  alias Notifier.Repo
  alias Notifier.Organization.User

  def build_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
  end

  def create_user(attrs) do
    attrs
    |> build_user
    |> Repo.insert
  end

  def list_users do
    Repo.all(User)
  end

  def get_user_by_email(email), do: Repo.get_by(User, email: email)

  def get_user_by_credentials(%{"email" => email, "password" => pass} ) do
    user = get_user_by_email(email)
    cond do
      user && Bcrypt.verify_pass(pass, user.password_hash) ->
        user
      true ->
        :error
    end
  end

  def get_user!(id), do: Repo.get!(User, id)

  def get_user(id), do: Repo.get(User, id)

  # def create_user(attrs \\ %{}) do
  #   %User{}
  #   |> User.changeset(attrs)
  #   |> Repo.insert()
  # end

  # def update_user(%User{} = user, attrs) do
  #   user
  #   |> User.changeset(attrs)
  #   |> Repo.update()
  # end

  # def delete_user(%User{} = user) do
  #   Repo.delete(user)
  # end

 
  # def change_user(%User{} = user) do
  #   User.changeset(user, %{})
  # end

  alias Notifier.Organization.Memo

 
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
