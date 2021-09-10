defmodule HomeworkApp.Question.Create do
  alias HomeworkApp.Schemas.Questions
  alias HomeworkApp.Repo

  def call_question(params) do
    result =
      params
      |> Questions.changeset()
      |> Repo.insert()

    with {:ok, question} <- result do
      question = Repo.preload(question, :user)
      {:ok, question}
    end
  end
end
