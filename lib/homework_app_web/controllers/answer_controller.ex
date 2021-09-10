defmodule HomeworkAppWeb.AnswerController do
  alias HomeworkApp.Schemas.Answers
  use HomeworkAppWeb, :controller

  def index(conn, _params) do
    with {:ok, answers} <- HomeworkApp.fetch_all_answers() do
      conn
      |> put_status(:ok)
      |> render("answers.json", answers: answers)
    end
  end

  def create(conn, params) do
    case HomeworkApp.create_asnwer(params) |> IO.inspect() do
      {:ok, %Answers{} = answers} ->
        conn
        |> put_status(:created)
        |> render("create_answer.json", answers: answers)

      _ ->
        {:error, :unauthorized}
    end
  end
end
