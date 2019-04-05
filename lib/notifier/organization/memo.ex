defmodule Notifier.Organization.Memo do
  use Ecto.Schema
  import Ecto.Changeset

  alias Notifier.Organization.{User, Memo}
  alias Notifier.Organization.Recipent

  # schema "memos" do
  #   field :message, :string
  #   field :title, :string
  #   field :is_draft, :boolean
  #   belongs_to :user, User


  schema "memos" do
     field :message, :string
     field :title, :string
     field :is_draft, :boolean

     many_to_many(
      :users,
      User,
      join_through: "recipents",
      on_replace: :delete)

    timestamps()
  end

  def changeset(memo, attrs) do
    memo
    |> cast(attrs, [:title, :message, :is_draft])
    |> validate_required([:title, :message, :is_draft])

  end

end
