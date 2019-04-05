defmodule NotifierWeb.MemoController do
  use NotifierWeb, :controller
  alias Notifier.Organization
  alias Notifier.Organization.Memo
  alias Notifier.Organization.User

  def index(conn, _params) do
    memos = Organization.fetch_draft_memo
    render(conn, "index.html", memos: memos)
  end

  def new(conn, _) do
    changeset = Organization.build_memo()
    render(conn, :new, changeset: changeset)
  end


  def edit(conn, %{"id" => id}) do
    user = Organization.list_users
    memo = Organization.get_memo!(id)
 render(conn, "add.html", user: user, memo: memo)
  end

  def create(conn, %{"memo" => memo_params}) do
    memo_params = Map.put(memo_params, "is_draft", true)
    memo_params = Map.put(memo_params, "user_id", 1)
    IO.inspect memo_params
    case Organization.create_memo(memo_params) do
      {:ok, memo} ->
        conn
        |> put_flash(:info, "Memo created successfully.")
        |> redirect(to: Routes.memo_path(conn, :index))
    {:error, changeset} ->
       conn
       |> render(:new, changeset: changeset)
    end
  end

  def add(conn, %{"id" => id}) do
    user = Organization.list_users
    memo = Organization.get_memo!(id)
 render(conn, "add.html", user: user, memo: memo)

  end

  def send(conn, %{ "user" => user_params}) do
    memo_id = Map.get(user_params, "memo_id")
    user_id = Map.get(user_params, "user_id")


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
