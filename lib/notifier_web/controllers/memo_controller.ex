defmodule NotifierWeb.MemoController do
  use NotifierWeb, :controller
  alias Notifier.Organization
  alias Notifier.Organization.Memo

  def index(conn, _params) do
    memo = Organization.fetch_draft_memo
    IO.inspect "memo"
    IO.inspect memo
    render(conn, "index.html", memo: memo)
  end

  def new(conn, _) do
    changeset = Organization.build_memo()
    render(conn, :new, changeset: changeset)
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
