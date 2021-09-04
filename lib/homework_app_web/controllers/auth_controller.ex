defmodule HomeworkAppWeb.AuthController do
  use HomeworkAppWeb, :controller
  alias HomeworkAppWeb.Auth.Guardian
  alias HomeworkApp.Schemas.User
  alias HomeworkApp.User.Get

  def login(conn, %{"email" => email}) do
    IO.inspect(System.get_env("SECRET_KEY_BASE"))
    with {:ok, %User{} = user} <- Get.by_email(email),
        {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
          conn
          |> put_status(:ok)
          |> render("login.json", token: token)
        end
  end
end
