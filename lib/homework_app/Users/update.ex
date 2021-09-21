defmodule HomeworkApp.User.Update do
  alias HomeworkApp.Schemas.User
  alias HomeworkApp.Repo

  def update_user(params) do
    {:ok, user} = HomeworkApp.User.Get.by_id(params["id"])

    user
    |> User.update_changeset(params)
    |> Repo.update()
  end
end
