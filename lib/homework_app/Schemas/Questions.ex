defmodule HomeworkApp.Schemas.Questions do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: [:id, :content, :user]}

  schema "questions" do
    belongs_to :user, HomeworkApp.Schemas.User, type: :binary_id
    field :content, :string
  end

  def changeset(questions \\ %__MODULE__{}, attrs) do
    questions
    |> cast(attrs, [:content, :user_id])
    |> validate_required([:content, :user_id])
    |> foreign_key_constraint(:user_id)
  end
end
