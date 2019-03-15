defmodule Tracker.Time_Stamps do
  import Ecto.Query, warn: false
  alias Tracker.Repo
  alias Tracker.TimeStamps.TimeStamp

  def list_timestamps do
    Repo.all(TimeStamp)
  end

  def get_timestamp!(id), do: Repo.get!(TimeStamp, id)

  def create_time_stamp(attrs \\ %{}) do
    IO.inspect(attrs)
    %TimeStamp{}
    |> TimeStamp.changeset(attrs)
    |> Repo.insert()
  end

  def update_timestamp(%TimeStamp{} = timestamp, attrs) do
    timestamp
    |> TimeStamp.changeset(attrs)
    |> Repo.update()
  end

  def delete_timestamp(%TimeStamp{} = timestamp) do
    Repo.delete(timestamp)
  end

  def change_timestamp(%TimeStamp{} = timestamp) do
    TimeStamp.changeset(timestamp, %{})
  end
 
  def change_end(%TimeStamp{} = timestamp, endtime) do
    id = timestamp.id
    start = timestamp.start_time
    attrs = %{"task_id" => id, "start_time" => start, "end_time" => endtime}
    update_timestamp(timestamp, attrs)
  end

end
