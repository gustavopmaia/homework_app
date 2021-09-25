defmodule HomeworkApp.Question.Delete do
  alias HomeworkApp.Repo

  def delete_question(params) do
    {:ok, question} = HomeworkApp.Question.Get.by_id(params["id"])

    question
    |> Repo.delete()
  end
end
