defmodule HomeworkApp.Schemas.Answers do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: [:id, :content, :user, :question]}

  schema "answers" do
    belongs_to :question, HomeworkApp.Schemas.Questions, type: :binary_id
    belongs_to :user, HomeworkApp.Schemas.User, type: :binary_id
    field :content, :string
  end

  def changeset(answers \\ %__MODULE__{}, attrs) do
    answers
    |> cast(attrs, [:content, :question_id, :user_id])
    |> validate_required([:content, :question_id, :user_id])
    |> foreign_key_constraint(:question_id)
    |> foreign_key_constraint(:user_id)
  end

  def update_changeset(answer \\ %__MODULE__{}, attrs) do
    answer
    |> cast(attrs, [:content])
  end
end
