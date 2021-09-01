defmodule HomeworkApp.Question.Create do
  alias HomeworkApp.Schemas.Questions
  alias HomeworkApp.Repo

  def call(params) do
    params
    |> Questions.changeset()
    |> Repo.insert()
  end
end
