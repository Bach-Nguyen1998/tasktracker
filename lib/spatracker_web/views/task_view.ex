defmodule SpatrackerWeb.TaskView do
  use SpatrackerWeb, :view
  alias SpatrackerWeb.TaskView

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, TaskView, "task.json")}
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      title: task.title,
      desc: task.desc,
      time_spent: task.time_spent,
      complete: task.complete,
      user: task.user}
  end
end
