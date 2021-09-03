defmodule HomeworkApp.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Argon2

  @primary_key {:id, :binary_id, autogenerate: true}

  @derive {Jason.Encoder, only: [:id, :username, :email]}

  schema "users" do
    field :username, :string, size: 15
    field :email, :string
    field :password, :string, redact: true

    timestamps()
  end

  def changeset(user \\ %__MODULE__{}, attrs) do
    user
    |> cast(attrs, [:username, :email, :password])
    |> validate_required([:username, :email, :password])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, password: Argon2.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset
end
