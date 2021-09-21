defmodule HomeworkAppWeb.Auth.Pipeline do
  use Guardian.Plug.Pipeline, otp_app: :homework_app

  plug Guardian.Plug.VerifyHeader
  plug Guardian.Plug.LoadResource
  plug Guardian.Plug.EnsureAuthenticated
  plug HomeworkAppWeb.Plugs.CurrentUser
end
