defmodule HomeworkApp.Answer.Get do
  alias HomeworkApp.Schemas.Answers
  alias HomeworkApp.Repo

  def index() do
    case Repo.all(Answers) do
      nil -> {:error, "Error at questions index"}
      answers -> {:ok, Repo.preload(answers, :user)}
    end
  end
end
