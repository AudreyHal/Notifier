defmodule NotifierWeb.RegistrationController do
  use NotifierWeb, :controller

  alias Notifier.Organization

  # plug :put_layout, "session.html"

  def new(conn, _) do
    changeset = Organization.build_user()
    render conn, "new.html", changeset: changeset,
    layout: {NotifierWeb.LayoutView, "registration.html"}
  end

  def create(conn, %{"registration" => registration_params}) do
    case Organization.create_user(registration_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "Registration successful")
        |> redirect(to: Routes.session_path(conn, :new))
    {:error, changeset} ->
       conn
       |> render(:new, changeset: changeset) 
    end
  end

end