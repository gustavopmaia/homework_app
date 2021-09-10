defmodule HomeworkAppWeb.Router do
  use HomeworkAppWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug HomeworkAppWeb.Auth.Pipeline
  end

  scope "/api", HomeworkAppWeb do
    pipe_through :api

    post "/users", UserController, :create
  end

  scope "/api", HomeworkAppWeb do
    pipe_through [:api, :auth]

    get "/users", UserController, :index
    get "/users/:id", UserController, :show

    get "/questions", QuestionController, :index
    get "/questions/:id", QuestionController, :show
    post "/questions", QuestionController, :create

    get "/answers", AnswerController, :index
    get "/answers/:id", AnswerController, :show
    post "/answers", AnswerController, :create
  end

  scope "/auth", HomeworkAppWeb do
    pipe_through :api

    post "/login", AuthController, :login
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through [:fetch_session, :protect_from_forgery]
      live_dashboard "/dashboard", metrics: HomeworkAppWeb.Telemetry
    end
  end
end
