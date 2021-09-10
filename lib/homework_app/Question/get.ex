defmodule HomeworkApp.Question.Get do
  alias HomeworkApp.Schemas.Questions
  alias HomeworkApp.Repo

  def index() do
    case Repo.all(Questions) do
      nil -> {:error, "Error at questions index"}
      questions -> {:ok, Repo.preload(questions, :user)}
    end
  end

  def by_id(id) do
    case Repo.get(Questions, id) do
      nil -> {:error, "Question not found"}
      question -> {:ok, Repo.preload(question, :user)}
    end
  end
end
