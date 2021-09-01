defmodule HomeworkApp.Answer.Create do
  alias HomeworkApp.Schemas.Answers
  alias HomeworkApp.Repo

  def call_answer(params) do
    result =
      params
      |> Answers.changeset()
      |> Repo.insert()

    with {:ok, answer} <- result do
      Repo.preload(answer, :question)
    end
  end
end
