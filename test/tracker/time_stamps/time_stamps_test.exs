defmodule Tracker.TimeStampsTest do
  use Tracker.DataCase

  alias Tracker.TimeStamps

  describe "timestamps" do
    alias Tracker.TimeStamps.TimeStamp

    @valid_attrs %{end_time: "some end_time", start_time: "some start_time", utc_datetime: "some utc_datetime"}
    @update_attrs %{end_time: "some updated end_time", start_time: "some updated start_time", utc_datetime: "some updated utc_datetime"}
    @invalid_attrs %{end_time: nil, start_time: nil, utc_datetime: nil}

    def time_stamp_fixture(attrs \\ %{}) do
      {:ok, time_stamp} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TimeStamps.create_time_stamp()

      time_stamp
    end

    test "list_timestamps/0 returns all timestamps" do
      time_stamp = time_stamp_fixture()
      assert TimeStamps.list_timestamps() == [time_stamp]
    end

    test "get_time_stamp!/1 returns the time_stamp with given id" do
      time_stamp = time_stamp_fixture()
      assert TimeStamps.get_time_stamp!(time_stamp.id) == time_stamp
    end

    test "create_time_stamp/1 with valid data creates a time_stamp" do
      assert {:ok, %TimeStamp{} = time_stamp} = TimeStamps.create_time_stamp(@valid_attrs)
      assert time_stamp.end_time == "some end_time"
      assert time_stamp.start_time == "some start_time"
      assert time_stamp.utc_datetime == "some utc_datetime"
    end

    test "create_time_stamp/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeStamps.create_time_stamp(@invalid_attrs)
    end

    test "update_time_stamp/2 with valid data updates the time_stamp" do
      time_stamp = time_stamp_fixture()
      assert {:ok, %TimeStamp{} = time_stamp} = TimeStamps.update_time_stamp(time_stamp, @update_attrs)
      assert time_stamp.end_time == "some updated end_time"
      assert time_stamp.start_time == "some updated start_time"
      assert time_stamp.utc_datetime == "some updated utc_datetime"
    end

    test "update_time_stamp/2 with invalid data returns error changeset" do
      time_stamp = time_stamp_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeStamps.update_time_stamp(time_stamp, @invalid_attrs)
      assert time_stamp == TimeStamps.get_time_stamp!(time_stamp.id)
    end

    test "delete_time_stamp/1 deletes the time_stamp" do
      time_stamp = time_stamp_fixture()
      assert {:ok, %TimeStamp{}} = TimeStamps.delete_time_stamp(time_stamp)
      assert_raise Ecto.NoResultsError, fn -> TimeStamps.get_time_stamp!(time_stamp.id) end
    end

    test "change_time_stamp/1 returns a time_stamp changeset" do
      time_stamp = time_stamp_fixture()
      assert %Ecto.Changeset{} = TimeStamps.change_time_stamp(time_stamp)
    end
  end

  describe "timestamps" do
    alias Tracker.TimeStamps.TimeStamp

    @valid_attrs %{end_time: "2010-04-17T14:00:00Z", start_time: "2010-04-17T14:00:00Z"}
    @update_attrs %{end_time: "2011-05-18T15:01:01Z", start_time: "2011-05-18T15:01:01Z"}
    @invalid_attrs %{end_time: nil, start_time: nil}

    def time_stamp_fixture(attrs \\ %{}) do
      {:ok, time_stamp} =
        attrs
        |> Enum.into(@valid_attrs)
        |> TimeStamps.create_time_stamp()

      time_stamp
    end

    test "list_timestamps/0 returns all timestamps" do
      time_stamp = time_stamp_fixture()
      assert TimeStamps.list_timestamps() == [time_stamp]
    end

    test "get_time_stamp!/1 returns the time_stamp with given id" do
      time_stamp = time_stamp_fixture()
      assert TimeStamps.get_time_stamp!(time_stamp.id) == time_stamp
    end

    test "create_time_stamp/1 with valid data creates a time_stamp" do
      assert {:ok, %TimeStamp{} = time_stamp} = TimeStamps.create_time_stamp(@valid_attrs)
      assert time_stamp.end_time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert time_stamp.start_time == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
    end

    test "create_time_stamp/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TimeStamps.create_time_stamp(@invalid_attrs)
    end

    test "update_time_stamp/2 with valid data updates the time_stamp" do
      time_stamp = time_stamp_fixture()
      assert {:ok, %TimeStamp{} = time_stamp} = TimeStamps.update_time_stamp(time_stamp, @update_attrs)
      assert time_stamp.end_time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert time_stamp.start_time == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
    end

    test "update_time_stamp/2 with invalid data returns error changeset" do
      time_stamp = time_stamp_fixture()
      assert {:error, %Ecto.Changeset{}} = TimeStamps.update_time_stamp(time_stamp, @invalid_attrs)
      assert time_stamp == TimeStamps.get_time_stamp!(time_stamp.id)
    end

    test "delete_time_stamp/1 deletes the time_stamp" do
      time_stamp = time_stamp_fixture()
      assert {:ok, %TimeStamp{}} = TimeStamps.delete_time_stamp(time_stamp)
      assert_raise Ecto.NoResultsError, fn -> TimeStamps.get_time_stamp!(time_stamp.id) end
    end

    test "change_time_stamp/1 returns a time_stamp changeset" do
      time_stamp = time_stamp_fixture()
      assert %Ecto.Changeset{} = TimeStamps.change_time_stamp(time_stamp)
    end
  end
end
