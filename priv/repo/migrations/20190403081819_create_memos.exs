defmodule Notifier.Repo.Migrations.CreateMemos do
  use Ecto.Migration

  def change do
    create table(:memos) do
      add :title, :string
      add :message, :string
     

      timestamps()
    end

  end
end
