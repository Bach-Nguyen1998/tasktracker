defmodule Tracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :complete, :boolean, default: false
    field :desc, :string, null: false
    field :time_spent, :integer, default: 0
    field :title, :string, null: false
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
    |> validate_number(:time_spent, greater_than_or_equal_to: 0)
    |> mult_of_15(:time_spent)
  end

  # ATTRIBUTION: https://medium.com/@QuantLayer/writing-custom-validations-for-ecto-changesets-4971881c7684
  def mult_of_15(changeset, field, options \\ []) do
    validate_change(changeset, field, fn _, time_spent ->
      case rem(time_spent, 15) == 0 do
        true -> []
        false -> [{field, options[:message] || "Not a multiple of 15"}]
      end
    end)
  end
end
