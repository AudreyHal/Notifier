defmodule Notifier.Organization.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Notifier.Organization.Memo

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string
    has_many :memos, Memo

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
  end
end
