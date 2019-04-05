defmodule Notifier.Repo.Migrations.CreateRecipents do
  use Ecto.Migration

  def change do
    create table(:recipents) do
      add :memo_id, references(:memos, on_delete: :delete_all)
      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create (index(:recipents, [:memo_id]))
    create (index(:recipents, [:user_id]))
    create (unique_index(:recipents, [:user_id, :memo_id]))

  end
end
