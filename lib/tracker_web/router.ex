defmodule TrackerWeb.Router do
  use TrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug TrackerWeb.Plugs.FetchSession
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TrackerWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/taskmenu", PageController, :taskmenu
    resources "/users", UserController
    resources "/tasks", TaskController
    resources "/sessions", SessionController, only: [:create, :delete], singleton: true
  end

  # Other scopes may use custom stacks.
  # scope "/api", TrackerWeb do
  #   pipe_through :api
  # end
end
