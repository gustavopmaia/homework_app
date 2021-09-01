defmodule HomeworkAppWeb.UserView do
  use HomeworkAppWeb, :view
  alias HomeworkApp.Schemas.User

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created",
      user: user
    }
  end
end
