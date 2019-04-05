defmodule Notifier.Organization.Memo do
  use Ecto.Schema
  import Ecto.Changeset

  alias Notifier.Organization.User

  schema "memos" do
    field :message, :string
    field :title, :string
    field :is_draft, :boolean
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(memo, attrs) do
    memo
    |> cast(attrs, [:title, :message, :is_draft, :user_id])
    |> validate_required([:title, :message, :is_draft, :user_id])
  end

end
