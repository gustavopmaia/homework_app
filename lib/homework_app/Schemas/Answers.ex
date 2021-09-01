defmodule HomeworkApp.Schemas.Answers do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "answers" do
    belongs_to :question, HomeworkApp.Schemas.Questions, type: :binary_id
    field :username, :string
    field :content, :string
  end

  def changeset(answers \\ %__MODULE__{}, attrs) do
    answers
    |> cast(attrs, [:username, :content, :question_id])
    |> validate_required([:username, :content])
  end
end
