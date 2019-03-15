defmodule TrackerWeb.TimeStampControllerTest do
  use TrackerWeb.ConnCase

  alias Tracker.TimeStamps
  alias Tracker.TimeStamps.TimeStamp

  @create_attrs %{
    end_time: "2010-04-17T14:00:00Z",
    start_time: "2010-04-17T14:00:00Z"
  }
  @update_attrs %{
    end_time: "2011-05-18T15:01:01Z",
    start_time: "2011-05-18T15:01:01Z"
  }
  @invalid_attrs %{end_time: nil, start_time: nil}

  def fixture(:time_stamp) do
    {:ok, time_stamp} = TimeStamps.create_time_stamp(@create_attrs)
    time_stamp
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all timestamps", %{conn: conn} do
      conn = get(conn, Routes.time_stamp_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create time_stamp" do
    test "renders time_stamp when data is valid", %{conn: conn} do
      conn = post(conn, Routes.time_stamp_path(conn, :create), time_stamp: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.time_stamp_path(conn, :show, id))

      assert %{
               "id" => id,
               "end_time" => "2010-04-17T14:00:00Z",
               "start_time" => "2010-04-17T14:00:00Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.time_stamp_path(conn, :create), time_stamp: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update time_stamp" do
    setup [:create_time_stamp]

    test "renders time_stamp when data is valid", %{conn: conn, time_stamp: %TimeStamp{id: id} = time_stamp} do
      conn = put(conn, Routes.time_stamp_path(conn, :update, time_stamp), time_stamp: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.time_stamp_path(conn, :show, id))

      assert %{
               "id" => id,
               "end_time" => "2011-05-18T15:01:01Z",
               "start_time" => "2011-05-18T15:01:01Z"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, time_stamp: time_stamp} do
      conn = put(conn, Routes.time_stamp_path(conn, :update, time_stamp), time_stamp: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete time_stamp" do
    setup [:create_time_stamp]

    test "deletes chosen time_stamp", %{conn: conn, time_stamp: time_stamp} do
      conn = delete(conn, Routes.time_stamp_path(conn, :delete, time_stamp))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.time_stamp_path(conn, :show, time_stamp))
      end
    end
  end

  defp create_time_stamp(_) do
    time_stamp = fixture(:time_stamp)
    {:ok, time_stamp: time_stamp}
  end
end
