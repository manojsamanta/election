defmodule ElectionWeb.Router do
  use ElectionWeb, :router

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

  scope "/", ElectionWeb do
    pipe_through :browser

    get "/", VoterController, :index
    post "/result", VoterController, :result
    post "/result2", VoterController, :result2
  end

  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: ElectionWeb.Telemetry
    end
  end
end
