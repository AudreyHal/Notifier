defmodule Notifier.Repo.Migrations.UpdateMemoMessageDataType do
  use Ecto.Migration

  def change do
    alter table(:memos) do
      modify :message, :text
    end
  end
end
