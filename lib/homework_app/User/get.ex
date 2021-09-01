defmodule HomeworkApp.User.Get do
  use HomeworkAppWeb, :controller
  alias HomeworkApp.Repo

  defp conn_with_status(conn, nil) do
    conn
      |> put_status(:not_found)
  end
  defp conn_with_status(conn, _) do
    conn
      |> put_status(:ok)
  end

  def index(conn) do
    users = Repo.all(HomeworkApp.Schemas.User)
    json conn_with_status(conn, users), users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(HomeworkApp.Schemas.User, String.to_integer(id))
    json conn_with_status(conn, user), user
  end
end
