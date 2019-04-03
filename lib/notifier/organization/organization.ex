defmodule Notifier.Organization do
  import Ecto.Query, warn: false
  alias Notifier.Repo
  alias Notifier.Organization.User
  alias Notifier.Organization.Memo



  # def list_memos do
  #   Repo.all(Memo)
  # end

  def get_memo!(id), do: Repo.get!(Memo, id)

  def create_memo(attrs \\ %{}) do
    %Memo{}
    |> Memo.changeset(attrs)
    |> Repo.insert()
  end

  def update_memo(%Memo{} = memo, attrs) do
    memo
    |> Memo.changeset(attrs)
    |> Repo.update()
  end

  def delete_memo(%Memo{} = memo) do
    Repo.delete(memo)
  end

  def change_memo(%Memo{} = memo) do
    Memo.changeset(memo, %{})
  end


  def list_memos do
    memo1 = %Memo{
      id: 1,
      title: "My Memo title1",
      status: "Read"
    }
    memo2 = %Memo{
      id: 2,
      title: "My Memo title1",
      status: "Read"
    }
    memo3 = %Memo{
      id: 3,
      title: "My Memo title1",
      status: "Read"
    }
    memo4 = %Memo{
      id: 4,
      title: "My Memo title1",
      status: "Read"
    }
    [memo1,memo2,memo3,memo4]
  end

end
