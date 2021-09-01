defmodule HomeworkAppWeb.UserController do
  use HomeworkAppWeb, :controller
  alias HomeworkApp.Repo
  alias HomeworkApp.Schemas.User

  defp conn_with_status(conn, nil) do
    conn
      |> put_status(:not_found)
  end
  defp conn_with_status(conn, _) do
    conn
      |> put_status(:ok)
  end

  def index(conn, _params) do
    users = Repo.all(HomeworkApp.Schemas.User)
    json conn_with_status(conn, users), users
  end

  def show(conn, %{"id" => id}) do
    user = Repo.get(HomeworkApp.Schemas.User, String.to_integer(id))
    json conn_with_status(conn, user), user
  end

  def create(conn, params) do

    with {:ok, %User{} = user} <- HomeworkApp.Create.call_user(params) do
        conn
        |> put_status(:create)
        |> render("create.json", user: user) end
  end
end
