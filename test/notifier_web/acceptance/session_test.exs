defmodule NotifierWeb.Acceptance.SessionTest do
  use Notifier.DataCase
  use Hound.Helpers

  hound_session()

  setup do
    ## GIVEN ##
    # There is a valid registered user
    alias Notifier.Organization
    valid_attrs = %{
      "name" => "John",
      "email" => "john@example.com",
      "password" => "secret",
      
    }
    {:ok, _} = Organization.create_user(valid_attrs)
    :ok
  end

  test "successful login for valid credential" do
    ## When ##
    navigate_to("/login")

    form = find_element(:id, "session-form")
    find_within_element(form, :name, "session[email]")
    |> fill_field("john@example.com")

    find_within_element(form, :name, "session[password]")
    |> fill_field("secret")

    find_within_element(form, :tag, "button")
    |> click

    ## THEN ##
    assert current_path() == "/"
    message = find_element(:class, "alert-info")
              |> visible_text()

    assert message == "Login successful"
  end

  test "shows error message for invalid credentials" do
    ## WHEN ##
    navigate_to("/login")

    form = find_element(:id, "session-form")

    find_within_element(form, :tag, "button")
    |> click

    ## THEN ##
    assert current_path() == "/login"
    message = find_element(:class, "alert-danger") |> visible_text()
    assert message == "Invalid username/password combination"
  end
end
