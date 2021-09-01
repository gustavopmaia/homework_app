defmodule HomeworkAppWeb.UserView do
  use HomeworkAppWeb, :view
  alias HomeworkApp.Schemas.User

  def render("user.json", %{user: %User{} = user}) do
    %{
      user: user
    }
  end

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created",
      user: user
    }
  end

  def render("users.json", %{user: %User{} = user}) do
    %{
      user: user
    }
  end
end
