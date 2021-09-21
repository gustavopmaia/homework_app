defmodule HomeworkAppWeb.UserController do
  use HomeworkAppWeb, :controller
  alias HomeworkApp.Schemas.User

  action_fallback HomeworkAppWeb.FallbackController
  plug :check_user when action in [:update]

  def index(conn, _params) do
    with {:ok, user} <- HomeworkApp.fetch_all_users() do
      conn
      |> put_status(:ok)
      |> render("users.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %User{} = user} <- HomeworkApp.get_user_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("user.json", user: user)
    end
  end

  def create(conn, params) do
    case HomeworkApp.create_user(params) do
      {:ok, %User{} = user} ->
        conn
        |> put_status(:created)
        |> render("create.json", user: user)

      _ ->
        {:error, :unauthorized}
    end
  end

  def update(conn, params) do
    with {:ok, user} <- HomeworkApp.User.Update.update_user(params) do
      conn
      |> put_status(:ok)
      |> render("update_user.json", user: user)
    else
      _ -> {:error, :unauthorized}
    end
  end

  def check_user(conn = %{params: %{"id" => id}, assigns: %{current_user: current_user}}, _opts) do
    # IO.inspect(conn)

    if id != current_user.id do
      {:error, :unauthorized}
    else
      conn
    end
  end
end
