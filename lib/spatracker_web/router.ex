defmodule SpatrackerWeb.Router do
  use SpatrackerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SpatrackerWeb do
    pipe_through :browser

    get "/", PageController, :index
    get "/users", PageController, :index
    get "/tasks", PageController, :index
    get "/makeuser", PageController, :index
    get "/maketask", PageController, :index
  end

  # Other scopes may use custom stacks.
   # TODO add routres the api scope
   scope "/api/v1", SpatrackerWeb do
     pipe_through :api
     resources "/users", UserController, except: [:new, :edit]
     resources "/tasks", TaskController, except: [:new, :edit]
     post "/auth", AuthController, :authenticate
   end
end
