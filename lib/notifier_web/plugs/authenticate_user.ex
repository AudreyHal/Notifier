defmodule NotifierWeb.Plugs.AuthenticateUser do
  import Plug.Conn
  import Phoenix.Controller, only: [redirect: 2, put_flash: 3]

  def init(_opts), do: nil

  def call(conn, _opts) do
    case conn.assigns[:current_user] do
      nil ->
         conn
         |> put_flash(:info, "You must be signed in")
         |> redirect(to: "/login")
         |> halt
      _ ->
         conn
    end
  end
end