defmodule Notifier.Organization.Recipent do
  use Ecto.Schema
  import Ecto.Changeset

  alias Notifier.Organization.Recipent
  alias Notifier.Organization.Memo
  alias Notifier.Organization.User
  alias Notifier.Organization

  schema "recipents" do
   belongs_to :memo, Memo
   belongs_to  :user, User

    timestamps()
  end

  @doc false
  def changeset(%Recipent{}= recipent, attrs) do
    recipent
    |> cast(attrs, [:user_id, :memo_id ])
    |> validate_required([])
  end


end
