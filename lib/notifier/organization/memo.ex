defmodule Notifier.Organization.Memo do
  use Ecto.Schema
  import Ecto.Changeset

  alias Notifier.Organization.User

  schema "memos" do
    field :message, :string
    field :recipient, :integer
    field :status, :string
    field :title, :string
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(memo, attrs) do
    memo
    |> cast(attrs, [:title, :message, :status, :sender, :recipient])
    |> validate_required([:title, :message, :status, :sender, :recipient])
  end
end
