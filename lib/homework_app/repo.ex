defmodule HomeworkApp.Repo do
  use Ecto.Repo,
    otp_app: :homework_app,
    adapter: Ecto.Adapters.Postgres
end
