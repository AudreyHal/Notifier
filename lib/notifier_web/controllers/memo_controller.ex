defmodule NotifierWeb.MemoController do
  use NotifierWeb, :controller
  alias Notifier.Organization
  alias Notifier.Organization.Memo

  def index(conn, _params) do
    memos = Organization.fetch_draft_memo
    render(conn, "index.html", memos: memos)
  end

  def new(conn, _) do
    changeset = Organization.build_memo()
    render(conn, :new, changeset: changeset)
  end

  def show(conn, %{"id" => id}) do
    memo = Organization.get_memo(id)
    render(conn, :edit, memo: memo)
  end

  def edit(conn, %{"id" => id}) do
    memo = Organization.get_memo(id)
    render(conn, :edit, memo: memo)
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
end
