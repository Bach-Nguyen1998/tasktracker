defmodule Tracker.TimeStamps.TimeStamp do
  use Ecto.Schema
  import Ecto.Changeset


  schema "timestamps" do
    field :end_time, :string
    field :start_time, :string
    field :task_id, :id, null: false

    timestamps()
  end

  @doc false
  def changeset(time_stamp, attrs) do
    time_stamp
    |> cast(attrs, [:start_time, :end_time, :task_id])
    |> validate_required([:start_time, :end_time, :task_id])
  end
end
