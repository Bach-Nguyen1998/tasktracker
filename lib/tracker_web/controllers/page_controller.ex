defmodule TrackerWeb.PageController do
  use TrackerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def taskmenu(conn, _params) do
    render(conn, "taskmenu.html")
  end

  def report(conn, _params) do
    render(conn, "report.html")
  end

  def logs(conn, _params) do
    render(conn, "logs.html")
  end
end
