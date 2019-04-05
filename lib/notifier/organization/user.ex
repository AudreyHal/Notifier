defmodule Notifier.Organization.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Bcrypt, only: [hash_pwd_salt: 1]

  alias Notifier.Organization.Memo

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    has_many :memos, Memo

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
    |> validate_format(:email, ~r/@/, message: "is invalid")
    |> validate_length(:password, min: 5, max: 10)
    |> unique_constraint(:email)

end
