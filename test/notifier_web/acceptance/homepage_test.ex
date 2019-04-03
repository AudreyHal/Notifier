defmodule NotifierWeb.Acceptance.HomepageTest do
  use Notifier.DataCase
  use Hound.Helpers

  hound_session()

  alias Notifier.Organization
  alias Notifier.Organization.Memo

  memo = %Memo{
    id: 1,
    title: "My Memo title"
    status: "Read"
  }

  test "presence of memos" do
    navigate_to("/")

    table = find_element(:css, ".table")
    id = find_within_element(table, :css, ".id") |> visible_text()
    title = find_within_element(table, :css, ".title") |> visible_text()
    status = find_within_element(table, :css, ".status") |> visible_text()

    assert id == "1"
    assert title == "My Memo title"
    assert status == "Read"
  end
end
