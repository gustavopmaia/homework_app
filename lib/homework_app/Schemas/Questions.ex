defmodule HomeworkApp.Schemas.Questions do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "questions" do
    field :username, :string
    field :content, :string
  end

  def changeset(questions \\ %__MODULE__{}, attrs) do
    questions
    |> cast(attrs, [:username, :content])
    |> validate_required([:username, :content])
  end
end
