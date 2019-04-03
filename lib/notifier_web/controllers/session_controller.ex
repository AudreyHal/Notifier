defmodule NotifierWeb.SessionController do
  use NotifierWeb, :controller

  alias Notifier.Organization

  def new(conn, _params) do
    render conn, "new.html",
    layout: {NotifierWeb.LayoutView, "login.html"}

  end


  def create(conn, %{"session" => session_params}) do
    case Organization.get_user_by_credentials(session_params) do
      :error ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
      user ->
        conn
        |> assign(:current_user, user)
        |> put_session(:user_id, user.id)
        |> configure_session(renew: true)
        |> put_flash(:info, "Login successful")
        |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def delete(conn, _) do
    clear_session(conn)
    |> put_flash(:info, "You have been logged out")
    |> redirect(to: Routes.page_path(conn, :index))
  end
  
end