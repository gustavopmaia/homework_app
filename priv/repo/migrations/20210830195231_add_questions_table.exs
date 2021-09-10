defmodule HomeworkApp.Repo.Migrations.AddQuestionsTable do
  use Ecto.Migration

  def change do
    create table(:questions, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :user_id, references(:users, type: :binary_id), null: false
      add :content, :string
    end
  end
end
