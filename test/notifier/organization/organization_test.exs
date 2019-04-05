defmodule Notifier.OrganizationTest do
  use Notifier.DataCase
  alias Notifier.Organization
  alias Notifier.Organization.User
  alias Notifier.Organization.Memo
  alias Notifier.Organization
  alias Notifier.Organization.Repo

  test "build_user/0 returns a user changeset" do
    assert %Ecto.Changeset{data: %User{}} = Organization.build_user
  end

  test "build_user/1 returns a user changeset with values applied" do
    attrs = %{"name" => "John"}
    changeset = Organization.build_user(attrs)
    assert changeset.params == attrs
  end

 test "send_to_recipent" do

memo_id = 1
user_id = 1

assert {:ok, customer} = Organization.add_recipent(memo_id, user_id)
end
end
