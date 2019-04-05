defmodule Notifier.Organization do
  import Ecto.Query, warn: false
  alias Notifier.Repo
  alias Notifier.Organization.User
  alias Notifier.Organization.Recipent

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

  @spec get_user_by_email(any()) :: any()
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

  def get_user!(id), do: Repo.get!(User, id) |> Repo.preload(:memos)




  # def create_user(attrs \\ %{}) do
  #   %User{}
  #   |> User.changeset(attrs)
  #   |> Repo.insert()
  # end

  # def update_user(%User{} = user, alias Notifier.Repo attrs) do
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

  def get_memo!(id), do: Repo.get!(Memo, id) |> Repo.preload(:users)

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

  @spec delete_memo(Notifier.Organization.Memo.t()) :: any()
  def delete_memo(%Memo{} = memo) do
    Repo.delete(memo)
  end

  def change_memo(%Memo{} = memo) do
    Memo.changeset(memo, %{})
  end


  def send_memo(%Memo{} = memo, %User{}= user) do
  memo
  |> Repo.preload(:users) # Load existing data
  |> Ecto.Changeset.change() # Build the changeset
  |> Ecto.Changeset.put_assoc(:users, [user]) # Set the association
  |> Repo.update!
  end


  def add_recipent( mid, %User{} = user) do
    Recipent.changeset(%Recipent{}, %{user_id: user.user_id, memo_id: mid})
    |>Repo.insert()

      end


  def add_recipent( mid, uid) do
Recipent.changeset(%Recipent{}, %{user_id: uid, memo_id: mid})
|> Repo.insert()

  end



  # def list_memos do
  #   memo1 = %Memo{
  #     id: 1,
  #     title: "My Memo title1",
  #     status: "Read"
  #   }
  #   memo2 = %Memo{
  #     id: 2,
  #     title: "My Memo title1",
  #     status: "Read"
  #   }
  #   memo3 = %Memo{
  #     id: 3,
  #     title: "My Memo title1",
  #     status: "Read"
  #   }
  #   memo4 = %Memo{
  #     id: 4,
  #     title: "My Memo title1",
  #     status: "Read"
  #   }
  #   [memo1,memo2,memo3,memo4]
  # end

end
