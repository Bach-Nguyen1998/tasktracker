defmodule Tracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :email, :string
    field :name, :string
    field :manager_id, :id, null: true
    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :manager_id])
    |> validate_required([:name, :email])
    |> unique_constraint(:name)
    |> unique_constraint(:email)
  end
end
