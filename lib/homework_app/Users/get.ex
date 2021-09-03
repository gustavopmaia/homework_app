defmodule HomeworkApp.User.Get do
  alias HomeworkApp.Schemas.User
  alias HomeworkApp.Repo

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, "Usuário não encontrado"}
      user -> {:ok, user}
    end
  end

  def by_email(email) do
    case Repo.get_by(User, email: email) do
      nil -> {:error, "Usuário não encontrado"}
      user -> {:ok, user}
    end
  end

  def index() do
    case Repo.all(User) do
      nil -> {:error, "Erro ao exibir usuarios"}
      user -> {:ok, user}
    end
  end
end
