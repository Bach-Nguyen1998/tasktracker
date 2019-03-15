defmodule Tracker.TimeStamps do
  @moduledoc """
  The TimeStamps context.
  """

  import Ecto.Query, warn: false
  alias Tracker.Repo

  alias Tracker.TimeStamps.TimeStamp

  @doc """
  Returns the list of timestamps.

  ## Examples

      iex> list_timestamps()
      [%TimeStamp{}, ...]

  """
  def list_timestamps do
    Repo.all(TimeStamp)
  end

  @doc """
  Gets a single time_stamp.

  Raises `Ecto.NoResultsError` if the Time stamp does not exist.

  ## Examples

      iex> get_time_stamp!(123)
      %TimeStamp{}

      iex> get_time_stamp!(456)
      ** (Ecto.NoResultsError)

  """
  def get_time_stamp!(id), do: Repo.get!(TimeStamp, id)

  @doc """
  Creates a time_stamp.

  ## Examples

      iex> create_time_stamp(%{field: value})
      {:ok, %TimeStamp{}}

      iex> create_time_stamp(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_time_stamp(attrs \\ %{}) do
    %TimeStamp{}
    |> TimeStamp.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a time_stamp.

  ## Examples

      iex> update_time_stamp(time_stamp, %{field: new_value})
      {:ok, %TimeStamp{}}

      iex> update_time_stamp(time_stamp, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_time_stamp(%TimeStamp{} = time_stamp, attrs) do
    time_stamp
    |> TimeStamp.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a TimeStamp.

  ## Examples

      iex> delete_time_stamp(time_stamp)
      {:ok, %TimeStamp{}}

      iex> delete_time_stamp(time_stamp)
      {:error, %Ecto.Changeset{}}

  """
  def delete_time_stamp(%TimeStamp{} = time_stamp) do
    Repo.delete(time_stamp)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking time_stamp changes.

  ## Examples

      iex> change_time_stamp(time_stamp)
      %Ecto.Changeset{source: %TimeStamp{}}

  """
  def change_time_stamp(%TimeStamp{} = time_stamp) do
    TimeStamp.changeset(time_stamp, %{})
  end
end
