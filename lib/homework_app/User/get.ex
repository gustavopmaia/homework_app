defmodule HomeworkApp.User.Get do
  use HomeworkAppWeb, :controller
  alias HomeworkApp.Repo

  def show(id) do
    case Repo.get(User, id) do
      nil -> {:error, "User not found"}
      user -> {:ok, user}
    end
  end
end
