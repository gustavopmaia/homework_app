defmodule HomeworkApp.User.Create do
  alias HomeworkApp.Schemas.User
  alias HomeworkApp.Schemas.Questions
  alias HomeworkApp.Schemas.Answers
  alias HomeworkApp.Repo

  def call_user(%{} = params) do
    params
    |> User.changeset()
    |> Repo.insert()
  end

  def call_question(%{} = params) do
    params
    |> Questions.changeset()
    |> Repo.insert()
  end

  def call_answer(%{} = params) do
    result =
      params
      |> Answers.changeset()
      |> Repo.insert()

    with {:ok, answer} <- result do
      Repo.preload(answer, :question)
    end
  end
end
