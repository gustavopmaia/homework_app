defmodule HomeworkApp.Answer.Get do
  alias HomeworkApp.Schemas.Answers
  alias HomeworkApp.Repo

  def index() do
    case Repo.all(Answers) do
      nil -> {:error, "Error at answers index"}
      answers -> {:ok, Repo.preload(answers, [[:question, :user], question: [:user]])}
    end
  end

  def by_id(id) do
    case Repo.get(Answers, id) do
      nil -> {:error, "Answer not found"}
      answer -> {:ok, Repo.preload(answer, [[:question, :user], question: [:user]])}
    end
  end
end
