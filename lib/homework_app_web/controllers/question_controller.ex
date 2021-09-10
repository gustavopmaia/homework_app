defmodule HomeworkAppWeb.QuestionController do
  alias HomeworkApp.Schemas.Questions
  use HomeworkAppWeb, :controller

  action_fallback HomeworkAppWeb.FallbackController

  def index(conn, _params) do
    with {:ok, questions} <- HomeworkApp.fetch_all_questions() do
      conn
      |> put_status(:ok)
      |> render("questions.json", questions: questions)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, %Questions{} = question} <- HomeworkApp.get_question_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("question.json", question: question)
    end
  end

  def create(conn, params) do
    case HomeworkApp.create_question(params) |> IO.inspect() do
      {:ok, %Questions{} = questions} ->
        conn
        |> put_status(:created)
        |> render("create_question.json", questions: questions)

      _ ->
        {:error, :unauthorized}
    end
  end
end
