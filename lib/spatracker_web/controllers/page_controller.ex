defmodule SpatrackerWeb.PageController do
  use SpatrackerWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
