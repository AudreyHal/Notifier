defmodule Notifier.AdministrationTest do
  use Notifier.DataCase

  alias Notifier.Administration

  describe "users" do
    alias Notifier.Administration.User

    @valid_attrs %{email: "some email", name: "some name", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", name: "some updated name", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, name: nil, password_hash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Administration.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Administration.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Administration.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Administration.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.name == "some name"
      assert user.password_hash == "some password_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Administration.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Administration.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.name == "some updated name"
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Administration.update_user(user, @invalid_attrs)
      assert user == Administration.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Administration.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Administration.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Administration.change_user(user)
    end
  end

  describe "admins" do
    alias Notifier.Administration.Admin

    @valid_attrs %{email: "some email", name: "some name", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", name: "some updated name", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, name: nil, password_hash: nil}

    def admin_fixture(attrs \\ %{}) do
      {:ok, admin} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Administration.create_admin()

      admin
    end

    test "list_admins/0 returns all admins" do
      admin = admin_fixture()
      assert Administration.list_admins() == [admin]
    end

    test "get_admin!/1 returns the admin with given id" do
      admin = admin_fixture()
      assert Administration.get_admin!(admin.id) == admin
    end

    test "create_admin/1 with valid data creates a admin" do
      assert {:ok, %Admin{} = admin} = Administration.create_admin(@valid_attrs)
      assert admin.email == "some email"
      assert admin.name == "some name"
      assert admin.password_hash == "some password_hash"
    end

    test "create_admin/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Administration.create_admin(@invalid_attrs)
    end

    test "update_admin/2 with valid data updates the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{} = admin} = Administration.update_admin(admin, @update_attrs)
      assert admin.email == "some updated email"
      assert admin.name == "some updated name"
      assert admin.password_hash == "some updated password_hash"
    end

    test "update_admin/2 with invalid data returns error changeset" do
      admin = admin_fixture()
      assert {:error, %Ecto.Changeset{}} = Administration.update_admin(admin, @invalid_attrs)
      assert admin == Administration.get_admin!(admin.id)
    end

    test "delete_admin/1 deletes the admin" do
      admin = admin_fixture()
      assert {:ok, %Admin{}} = Administration.delete_admin(admin)
      assert_raise Ecto.NoResultsError, fn -> Administration.get_admin!(admin.id) end
    end

    test "change_admin/1 returns a admin changeset" do
      admin = admin_fixture()
      assert %Ecto.Changeset{} = Administration.change_admin(admin)
    end
  end
end
