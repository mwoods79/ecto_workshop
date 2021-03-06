defmodule EctoWorkshopWeb.Router do
  use EctoWorkshopWeb, :router

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

  scope "/", EctoWorkshopWeb do
    pipe_through :browser

    get "/", PageController, :index
    resources "/recipes", RecipeController
  end

  # Other scopes may use custom stacks.
  # scope "/api", EctoWorkshopWeb do
  #   pipe_through :api
  # end
end
