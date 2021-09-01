defmodule HomeworkAppWeb.UserController do
  use HomeworkAppWeb, :controller
  alias HomeworkApp.Schemas.User



  def index(conn, _params) do
    HomeworkApp.User.Get.index(conn)
  end

  def show(conn, %{"id" => id}) do
    HomeworkApp.User.Get.show(id)
  end

  def create(conn, params) do

    with {:ok, %User{} = user} <- HomeworkApp.User.Create.call_user(params) do
        conn
        |> put_status(:created)
        |> render("create.json", user: user) end
  end
end
