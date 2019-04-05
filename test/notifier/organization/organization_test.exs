defmodule Notifier.OrganizationTest do
  use Notifier.DataCase
  alias Notifier.Organization
  alias Notifier.Organization.User

  test "build_user/0 returns a user changeset" do
    assert %Ecto.Changeset{data: %User{}} = Organization.build_user
  end

  test "build_user/1 returns a user changeset with values applied" do
    attrs = %{"name" => "John"}
    changeset = Organization.build_user(attrs)
    assert changeset.params == attrs
  end
end