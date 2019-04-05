defmodule Notifier.Organization.Memo do
   use Ecto.Schema
  import Ecto.Changeset

  alias Notifier.Organization.{User, Memo}
  alias Notifier.Organization.Recipent
  schema "memos" do
     field :message, :string
     field :title, :string

     many_to_many(
      :users,
      User,
      join_through: "recipents",
      on_replace: :delete
)


     timestamps()

   # defstruct [:id, :title, :status]


  @doc false
   def changeset(memo, attrs) do
     memo
     |> cast(attrs, [:title, :message])

     |> validate_required([:title, :message ])
   end
end
end
