defmodule Tracker2.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :manager_id, references(:users), null: true
      timestamps()
   end
     create unique_index(:users, [:name])
      create unique_index(:users, [:email])
 
  
  end
end
