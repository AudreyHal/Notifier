defmodule NotifierWeb.Plugs.LoadUserTest do
  use NotifierWeb.ConnCase
  alias Notifier.Organization

  @valid_attrs %{
    "name" => "John",
    "email" => "john@example.com",
    "password" => "secret",
    }

  test "fetch cart from session on subsequent visit" do
    # Create a new user
    {:ok, user} = Organization.create_user(@valid_attrs)

    # Build a new conn by posting login data to "/session" path
    conn = post build_conn(), "/login", %{"session" => @valid_attrs }

    # We reuse the same conn now instead of building a new one
    conn = get conn, "/"

    # now we expect the conn to have the `:current_user` data loaded in conn.
    assert user.id == conn.assigns.current_user.id
  end

end
