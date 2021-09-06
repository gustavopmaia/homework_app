defmodule HomeworkAppWeb.AuthController do
  use HomeworkAppWeb, :controller
  alias HomeworkAppWeb.Auth.Guardian
  alias HomeworkApp.Schemas.User

  def login(conn, %{"email" => email, "password" => password}) do
    with {:ok, %User{} = user} <- HomeworkApp.ValidatePassword.verify_user(%{email: email, password: password}),
         {:ok, token, _claims} <- Guardian.encode_and_sign(user) do
      conn
      |> put_status(:ok)
      |> render("login.json", token: token)
    end
  end
end
