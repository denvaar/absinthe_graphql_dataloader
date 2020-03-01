defmodule AbsintheDemoWeb.Router do
  use AbsintheDemoWeb, :router

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

  scope "/", AbsintheDemoWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # IMPORTANT!
  #   Remove the alias to "AbsintheDemoWeb" on this scope block!
  #   Otherwise you will get warnings and errors like:
  #   "function AbsintheDemoWeb.Absinthe.Plug.init/1 is undefined"
  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: AbsintheDemoWeb.GraphQL.Schema,
      socket: AbsintheDemoWeb.UserSocket

    forward "/", Absinthe.Plug, schema: AbsintheDemoWeb.GraphQL.Schema
  end
end
