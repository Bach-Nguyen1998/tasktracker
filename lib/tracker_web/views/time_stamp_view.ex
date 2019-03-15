defmodule TrackerWeb.TimeStampView do
  use TrackerWeb, :view
  alias TrackerWeb.TimeStampView

  def render("index.json", %{timestamps: timestamps}) do
    %{data: render_many(timestamps, TimeStampView, "time_stamp.json")}
  end

  def render("show.json", %{time_stamp: time_stamp}) do
    %{data: render_one(time_stamp, TimeStampView, "time_stamp.json")}
  end

  def render("time_stamp.json", %{time_stamp: time_stamp}) do
    %{id: time_stamp.id,
      start_time: time_stamp.start_time,
      end_time: time_stamp.end_time}
  end

  def get_start_time(task) do
    id = task.id
    time_stamp = Tracker.Time_Stamps.get_timestamp!(id) 
    if time_stamp.start_time == nil do# task has not been started
      "no start"
    else 
      time_stamp.start_time
    end
  end
end
