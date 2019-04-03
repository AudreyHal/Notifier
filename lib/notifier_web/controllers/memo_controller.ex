defmodule NotifierWeb.MemoController do
  use NotifierWeb, :controller
  alias Notifier.Organization
  alias Notifier.Organization.Memo

  def index(conn, _params) do
  memo = Organization.list_memos
    render(conn, "index.html", memo: memo)
  end

  def new(conn, _) do
    # changeset = Organization.build_memo()
    # users = Organization.list_users
    # render(conn, "new.html", changeset: changeset, users: users)
  end

  def create(conn, %{"memo" => memo_params}) do

  end
end
