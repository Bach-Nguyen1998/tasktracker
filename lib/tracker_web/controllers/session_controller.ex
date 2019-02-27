defmodule TrackerWeb.SessionController do
  use TrackerWeb, :controller

  def create(conn, %{"id" => id}) do
    IO.puts("in")
    user = Tracker.Users.get_user_by_email(id) || Tracker.Users.get_user_by_name(id)
    IO.puts("out")
    if user do
      conn
      |> put_session(:user_id, user.id)
      |> put_flash(:info, "Welcome back #{user.name}")
      |> redirect(to: Routes.page_path(conn, :index)) #TODO change this
    else
      conn
      |> put_flash(:error, "Login failed. Please try again.")
      |> redirect(to: Routes.page_path(conn, :index))
    end
  end

  def delete(conn, _params) do
    conn
    |> delete_session(:user_id)
    |> put_flash(:info, "Logged out.")
    |> redirect(to: Routes.page_path(conn, :index))
  end

end
