defmodule NotifierWeb.PageController do
  use NotifierWeb, :controller

  alias Notifier.Organization

  def index(conn, _params) do
    memos = Organization.list_memos
    render(conn, "index.html", memos: memos)
  end
end
