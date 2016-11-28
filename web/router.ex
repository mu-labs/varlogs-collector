defmodule Collector.Router do
  use Collector.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Collector do
    pipe_through :api

    resources "events", EventController, only: [:create, :index]
  end

end
