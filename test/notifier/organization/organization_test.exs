defmodule Notifier.OrganizationTest do
  use Notifier.DataCase

  alias Notifier.Organization

  describe "users" do
    alias Notifier.Organization.User

    @valid_attrs %{email: "some email", name: "some name", password: "some password"}
    @update_attrs %{email: "some updated email", name: "some updated name", password: "some updated password"}
    @invalid_attrs %{email: nil, name: nil, password: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organization.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Organization.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Organization.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Organization.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.password == "some password"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organization.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Organization.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.password == "some updated password"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Organization.update_user(user, @invalid_attrs)
      assert user == Organization.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Organization.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Organization.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Organization.change_user(user)
    end
  end

  describe "memos" do
    alias Notifier.Organization.Memo

    @valid_attrs %{message: "some message", recipient: 42, sender: 42, status: "some status", title: "some title"}
    @update_attrs %{message: "some updated message", recipient: 43, sender: 43, status: "some updated status", title: "some updated title"}
    @invalid_attrs %{message: nil, recipient: nil, sender: nil, status: nil, title: nil}

    def memo_fixture(attrs \\ %{}) do
      {:ok, memo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Organization.create_memo()

      memo
    end

    test "list_memos/0 returns all memos" do
      memo = memo_fixture()
      assert Organization.list_memos() == [memo]
    end

    test "get_memo!/1 returns the memo with given id" do
      memo = memo_fixture()
      assert Organization.get_memo!(memo.id) == memo
    end

    test "create_memo/1 with valid data creates a memo" do
      assert {:ok, %Memo{} = memo} = Organization.create_memo(@valid_attrs)
      assert memo.message == "some message"
      assert memo.recipient == 42
      assert memo.sender == 42
      assert memo.status == "some status"
      assert memo.title == "some title"
    end

    test "create_memo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Organization.create_memo(@invalid_attrs)
    end

    test "update_memo/2 with valid data updates the memo" do
      memo = memo_fixture()
      assert {:ok, %Memo{} = memo} = Organization.update_memo(memo, @update_attrs)
      assert memo.message == "some updated message"
      assert memo.recipient == 43
      assert memo.sender == 43
      assert memo.status == "some updated status"
      assert memo.title == "some updated title"
    end

    test "update_memo/2 with invalid data returns error changeset" do
      memo = memo_fixture()
      assert {:error, %Ecto.Changeset{}} = Organization.update_memo(memo, @invalid_attrs)
      assert memo == Organization.get_memo!(memo.id)
    end

    test "delete_memo/1 deletes the memo" do
      memo = memo_fixture()
      assert {:ok, %Memo{}} = Organization.delete_memo(memo)
      assert_raise Ecto.NoResultsError, fn -> Organization.get_memo!(memo.id) end
    end

    test "change_memo/1 returns a memo changeset" do
      memo = memo_fixture()
      assert %Ecto.Changeset{} = Organization.change_memo(memo)
    end
  end
end
