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


  @doc false
  def changeset(memo, attrs) do
    memo
    |> cast(attrs, [:title, :message, :status, :recipient])
    |> validate_required([:title, :message, :status, :recipient])
  end

end
