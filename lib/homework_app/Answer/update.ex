defmodule HomeworkApp.Answer.Update do
  alias HomeworkApp.Schemas.Answers
  alias HomeworkApp.Repo

  def update_answer(params) do
    {:ok, answer} = HomeworkApp.Answer.Get.by_id(params["id"])

    answer
    |> Answers.update_changeset(params)
    |> Repo.update()
  end
end
