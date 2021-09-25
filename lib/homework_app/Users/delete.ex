defmodule HomeworkApp.User.Delete do
  # alias HomeworkApp.Schemas.User
  alias HomeworkApp.Repo

  def delete_user(params) do
    {:ok, user} = HomeworkApp.User.Get.by_id(params["id"])

    user
    |> Repo.delete()
  end
end
