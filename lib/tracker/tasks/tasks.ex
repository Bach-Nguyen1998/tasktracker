defmodule Tracker.Tasks do
  import Ecto.Query, warn: false
  alias Tracker.Repo
  alias Tracker.Tasks.Task

  #list all tasks
  def list_tasks do # TODO: Filter by a given ID
    Repo.all(Task)
  end

  #retreive task by ID
  def get_task!(id), do: Repo.get!(Task, id)

  def get_task(id) do
    Repo.one from t in Task,
      where: t.id == ^id
  end

  def get_task_by_name(title) do
    Repo.get_by(Task, title: title)
  end

  def create_task(attrs \\ %{}) do
    %Task{}
    |> Task.changeset(attrs)
    |> Repo.insert()
  end

  # update a task
  def update_task(%Task{} = task, attrs) do
    task
    |> Task.changeset(attrs)
    |> Repo.update()
  end

  # delete a task
  def delete_task(%Task{} = task) do
    Repo.delete(task)
  end

  def change_task(%Task{} = task) do
    Task.changeset(task, %{})
  end
end


