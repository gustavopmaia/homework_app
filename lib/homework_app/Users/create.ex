defmodule HomeworkApp.User.Create do
  alias HomeworkApp.Schemas.User
  alias HomeworkApp.Repo

  def call(params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end
end
