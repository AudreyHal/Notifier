defmodule Notifier.Organization do
  import Ecto.Query, warn: false
  alias Notifier.Repo
  alias Notifier.Organization.User
  alias Notifier.Organization.Memo


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

  def get_memo!(id), do: Repo.get!(Memo, id)
  def get_memo(id), do: Repo.get(Memo, id)

  def build_memo(attrs \\ %{}) do
    %Memo{}
    |> Memo.changeset(attrs)
  end

  def create_memo(attrs) do
    attrs
    IO.inspect attrs
    |> build_memo
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

  def fetch_draft_memo do
    query = from m in Memo, where: m.is_draft == true

    Repo.all(query)
  end

  def list_memos do

  end

end
