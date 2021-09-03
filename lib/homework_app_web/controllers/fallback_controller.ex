defmodule HomeworkAppWeb.FallbackController do
  use HomeworkAppWeb, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(HomeworkAppWeb.ErrorView)
    |> render(:"401")
  end
end
