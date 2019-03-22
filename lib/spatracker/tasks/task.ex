defmodule Spatracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :complete, :boolean, default: false
    field :desc, :string
    field :time_spent, :integer
    field :title, :string
    field :user, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :time_spent, :complete, :user])
    |> validate_required([:title, :desc, :time_spent, :complete, :user])
    |> unique_constraint(:title)
    |> foreign_key_constraint(:user)
  end
end
