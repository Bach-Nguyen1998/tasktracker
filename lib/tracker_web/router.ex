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

  pipeline :ajax do
    plug :accepts, ["json"]
    plug :fetch_session
    plug :fetch_flash
    plug TrackerWeb.Plugs.FetchSession #potential point of failure
  end

  scope "/", TrackerWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/taskmenu", PageController, :taskmenu
    get "/report", PageController, :report
    get "/logs", PageController, :logs
    resources "/users", UserController
    resources "/tasks", TaskController
    resources "/sessions", SessionController, only: [:create, :delete], singleton: true
  end

  # Other scopes may use custom stacks.
  # scope "/api", TrackerWeb do
  #   pipe_through :api
  # end

  scope "/ajax", TrackerWeb do
    pipe_through :ajax
    resources "/time_stamps", TimeStampController, except: [:new, :edit]
  end
end
