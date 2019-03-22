defmodule SpatrackerWeb.TaskController do
  use SpatrackerWeb, :controller

  alias Spatracker.Tasks
  alias Spatracker.Tasks.Task

  action_fallback SpatrackerWeb.FallbackController

  def index(conn, _params) do
    tasks = Tasks.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"complete" => complete, "desc" => desc, "time_spent" => time_spent, "title" => title, "user" => user}) do
    with {:ok, %Task{} = task} <- Tasks.create_task(title, desc, user, time_spent, complete) do
      conn
      |> put_status(:created)
      |> render("show.json", task: task)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    render(conn, "show.json", task: task)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    with {:ok, %Task{} = task} <- Tasks.update_task(task, task_params) do
      render(conn, "show.json", task: task)
    end
  end

  def update(conn, %{"complete" => complete, "time_spent" => time_spent,"id" => id}) do
    task = Tasks.get_task!(id)
    title = task.title
    desc = task.desc
    user = task.user
    
    params = %{"title" => title, "desc" => desc, "user" => user, "complete" => complete, "time_spent" => time_spent}
    with {:ok, %Task{} = task} <- Tasks.update_task(task, params) do
      render(conn, "show.json", task: task)
    end
  end


  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)

    with {:ok, %Task{}} <- Tasks.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end
end
