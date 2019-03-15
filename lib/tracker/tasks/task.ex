defmodule Tracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :desc, :string, null: false
    field :title, :string, null: false
    field :user, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :user])
    |> validate_required([:title, :desc, :user])
    |> unique_constraint(:title)
    |> foreign_key_constraint(:user)
  end

  # ATTRIBUTION: https://medium.com/@QuantLayer/writing-custom-validations-for-ecto-changesets-4971881c7684
  #def mult_of_15(changeset, field, options \\ []) do
  #  validate_change(changeset, field, fn _, time_spent ->
  #    case rem(time_spent, 15) == 0 do
  #      true -> []
  #      false -> [{field, options[:message] || "Not a multiple of 15"}]
  #    end
  #  end)
  #end
end
