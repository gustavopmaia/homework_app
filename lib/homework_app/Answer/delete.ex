defmodule HomeworkApp.Answer.Delete do
  alias HomeworkApp.Repo

  def delete_answer(params) do
    {:ok, asnwer} = HomeworkApp.Answer.Get.by_id(params["id"])

    asnwer
    |> Repo.delete()
  end
end
