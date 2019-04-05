defmodule Notifier.Repo.Migrations.CreateMemos do
  use Ecto.Migration

  def change do
    create table(:memos) do
      add :title, :string
      add :message, :string
      add :is_draft, :boolean
      add :user_id, references(:users)

      timestamps()
    end

  end
end
