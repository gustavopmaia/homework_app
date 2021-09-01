defmodule HomeworkAppWeb.UserController do
  use HomeworkAppWeb, :controller
  alias HomeworkApp.Schemas.User

  def index(conn, _params) do
    with {:ok, %User{} = user} <- HomeworkApp.User.Get.index() do
      conn
      |> put_status(:ok)
      |> render("users.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    IO.inspect(id)

    with {:ok, %User{} = user} <- HomeworkApp.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def create(conn, params) do
    with {:ok, %User{} = user} <- HomeworkApp.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end
end
