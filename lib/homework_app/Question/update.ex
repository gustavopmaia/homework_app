defmodule HomeworkApp.Question.Update do
  alias HomeworkApp.Schemas.Questions
  alias HomeworkApp.Repo

  def update_question(params) do
    {:ok, question} = HomeworkApp.Question.Get.by_id(params["id"])

    question
    |> Questions.update_changeset(params)
    |> Repo.update()
  end
end
