defmodule NotifierWeb.MemoController do
  use NotifierWeb, :controller
  alias Notifier.Organization
  alias Notifier.Organization.Memo
  alias Notifier.Organization.User

  def index(conn, _params) do

  #memo = Organization.list_memos
   # render(conn, "index.html", memo: memo)
  end

  def new(conn, _) do
    # changeset = Organization.build_memo()
    # users = Organization.list_users
    # render(conn, "new.html", changeset: changeset, users: users)
  end

  def create(conn, %{"memo" => memo_params}) do

  end

  def add(conn, %{"id" => id}) do
    user = Organization.list_users
    memo = Organization.get_memo!(id)
 render(conn, "add.html", user: user, memo: memo)

  end

  def send(conn, %{ "user" => user_params}) do
    IO.inspect "user_params"
    IO.inspect user_params
    memo_id = Map.get(user_params, "memo_id")
    IO.inspect memo_id
    user_id = Map.get(user_params, "user_id")
    IO.inspect user_id

    case Organization.add_recipent(memo_id, user_id) do
      {:ok,_} ->
        conn
        |> put_flash(:info, "Memo sent successfully.")
        |> redirect(to: Routes.memo_path(conn, :new))

      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> put_flash(:info, "Memo already  sent to this user.")
        render conn, "new.html"
    end
  end

  def show(conn, %{"id" => id}) do
    IO.inspect id
    detail = Organization.get_memo!(id)
    render(conn, "show.html", detail: detail)
    end
end
