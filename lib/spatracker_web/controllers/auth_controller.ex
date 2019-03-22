defmodule SpatrackerWeb.AuthController do
  use SpatrackerWeb, :controller
  
  alias Spatracker.Users
  alias Spatracker.Users.User

  action_fallback SpatrackerWeb.FallbackController
  
  def authenticate(conn, %{"email" => email, "password" => password}) do
    with {:ok, %User{} = user} <- Users.authenticate_user(email, password) do
      resp = %{
        data: %{
          token: Phoenix.Token.sign(SpatrackerWeb.Endpoint, "user_id", user.id),
          user_id: user.id,
        }
      }

      conn
      |> put_resp_header("content-type", "application/json; charset=UTF-8")
      |> send_resp(:created, Jason.encode!(resp))

    end
  end

end
