defmodule HomeworkAppWeb.Auth.Guardian do
    use Guardian, otp_app: :homework_app
    alias HomeworkApp.User.Get
    alias HomeworkApp.Schemas.User

    def subject_for_token(%{email: email}, claims) do
      IO.inspect(claims)
      {:ok, %User{id: id}} = Get.by_email(email)
      {:ok, id}
    end

    def resource_from_claims(claims) do
      claims
      |> Map.get("sub")
      |> Get.by_id()
    end
  end
