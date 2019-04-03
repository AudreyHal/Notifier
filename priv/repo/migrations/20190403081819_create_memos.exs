defmodule Notifier.Repo.Migrations.CreateMemos do
  use Ecto.Migration

  def change do
    create table(:memos) do
      add :title, :string
      add :message, :string
      add :status, :string
      add :sender, references(:users)
      add :recipient, :integer

      timestamps()
    end

  end
end
