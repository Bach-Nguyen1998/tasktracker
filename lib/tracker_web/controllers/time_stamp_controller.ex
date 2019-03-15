defmodule TrackerWeb.TimeStampController do
  use TrackerWeb, :controller

  alias Tracker.TimeStamps
  alias Tracker.TimeStamps.TimeStamp

  action_fallback TrackerWeb.FallbackController

  def index(conn, _params) do
    timestamps = TimeStamps.list_timestamps()
    render(conn, "index.json", timestamps: timestamps)
  end

  def create(conn, %{"time_stamp" => time_stamp_params}) do
    with {:ok, %TimeStamp{} = time_stamp} <- Tracker.Time_Stamps.create_time_stamp(time_stamp_params) do
    conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.time_stamp_path(conn, :show, time_stamp))
      |> render("show.json", time_stamp: time_stamp)
    end
  end

  def show(conn, %{"id" => id}) do
    time_stamp = TimeStamps.get_time_stamp!(id)
    render(conn, "show.json", time_stamp: time_stamp)
  end

  def update(conn, %{"id" => id, "time_stamp" => time_stamp_params}) do
    time_stamp = TimeStamps.get_time_stamp!(id)

    with {:ok, %TimeStamp{} = time_stamp} <- TimeStamps.update_time_stamp(time_stamp, time_stamp_params) do
      render(conn, "show.json", time_stamp: time_stamp)
    end
  end

  def delete(conn, %{"id" => id}) do
    time_stamp = TimeStamps.get_time_stamp!(id)

    with {:ok, %TimeStamp{}} <- TimeStamps.delete_time_stamp(time_stamp) do
      send_resp(conn, :no_content, "")
    end
  end
end
