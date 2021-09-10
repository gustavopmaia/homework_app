defmodule HomeworkApp.Answer.Create do
  alias HomeworkApp.Schemas.Answers
  alias HomeworkApp.Repo

  def call_answer(params) do
    result =
      params
      |> Answers.changeset()
      |> Repo.insert()

    with {:ok, answer} <- result do
      answer = Repo.preload answer, [[:question, :user], question: [:user]]
      {:ok, answer}
    end
  end
end
