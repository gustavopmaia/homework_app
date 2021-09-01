defmodule HomeworkApp.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
      create table(:users, primary_key: false) do
        add :id, :binary_id, primary_key: true
        add :username, :string, size: 15
        add :email, :string
        add :password, :string, redact: true

        timestamps()
    end
  end
end
