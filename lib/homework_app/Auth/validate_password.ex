defmodule HomeworkApp.ValidatePassword do
  # alias HomeworkApp.Schemas.User
  alias HomeworkApp.User.Get

  def verify_user(%{email: email, password: password}) do
    {:ok, user} = Get.by_email(email)
    Argon2.check_pass(user, password, hash_key: :password)
  end
end
