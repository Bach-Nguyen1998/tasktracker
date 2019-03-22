defmodule Spatracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :desc, :text
      add :time_spent, :integer
      add :complete, :boolean, default: false, null: false
      add :user, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:user])
    create unique_index(:tasks, [:title])
  end
end
