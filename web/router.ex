defmodule PinsterPhoenix.Router do
  use PinsterPhoenix.Web, :router

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

  scope "/", PinsterPhoenix do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/links", LinkController, only: [:index, :create, :delete]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PinsterPhoenix do
  #   pipe_through :api
  # end
end
