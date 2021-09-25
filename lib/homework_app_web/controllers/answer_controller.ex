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

  def show(conn, %{"id" => id}) do
    with {:ok, %Answers{} = answer} <- HomeworkApp.get_answer_by_id(id) do
      conn
      |> put_status(:ok)
      |> render("answer.json", answer: answer)
    end
  end

  def update(conn, params) do
    with {:ok, answer} <- HomeworkApp.Answer.Update.update_answer(params) do
      conn
      |> put_status(:ok)
      |> render("update_answer.json", answer: answer)
    else
      _ -> {:error, :unauthorized}
    end
  end

  def delete(conn, params) do
    with {:ok, answer} <- HomeworkApp.Answer.Delete.delete_answer(params) do
      conn
      |> put_status(:ok)
      |> render("delete_answer.json", answer: answer)
    end
  end

  def check_user(conn = %{params: %{"id" => id}, assigns: %{current_user: current_user}}, _opts)
      when id == current_user.id do
    conn
  end

  def check_user(_conn = %{params: %{"id" => id}, assigns: %{current_user: current_user}}, _opts)
      when id == current_user.id do
    {:error, :unauthorized}
  end
end
