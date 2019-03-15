defmodule Tracker.Repo.Migrations.CreateTimestamps do
  use Ecto.Migration

  def change do
    create table(:timestamps) do
      add :start_time, :string
      add :end_time, :string
      add :task_id, references(:tasks, on_delete: :nothing)

      timestamps()
    end

    create index(:timestamps, [:task_id])
  end
end
