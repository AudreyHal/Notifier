defmodule NotifierWeb.UserController do
  use NotifierWeb, :controller

  alias Notifier.Organization
  alias Notifier.Organization.User

  def index(conn, _params) do
    users = Organization.list_users()
    render(conn, "index.html", users: users)
  end

    def new(conn, _params) do
    changeset = Organization.change_user(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    case Organization.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> redirect(to: Routes.user_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end