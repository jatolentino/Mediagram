defmodule MediagramWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug MediagramWeb.Context
    plug :accepts, ["json"]
  end

  scope "/" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL, schema: MediagramWeb.Schema

    forward "/", Absinthe.Plug, schema: MediagramWeb.Schema
  end
end
