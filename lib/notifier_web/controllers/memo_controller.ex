defmodule NotifierWeb.MemoController do
  use NotifierWeb, :controller
  alias Notifier.Organization

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def new(conn, _) do
    # changeset = Organization.build_memo()
    # users = Organization.list_users
    # render(conn, "new.html", changeset: changeset, users: users)
  end

  def create(conn, %{"memo" => memo_params}) do

  end
end
