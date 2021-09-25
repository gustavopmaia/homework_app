defmodule HomeworkAppWeb.UserView do
  use HomeworkAppWeb, :view
  alias HomeworkApp.Schemas.User

  def render("user.json", %{user: %User{} = user}) do
    %{
      user: %{id: user.id, username: user.username}
    }
  end

  def render("create.json", %{user: %User{} = user}) do
    %{
      message: "User created",
      user: render_one(user, __MODULE__, "user.json")
    }
  end

  def render("users.json", %{user: users}) do
    %{
      users: render_many(users, __MODULE__, "user.json")
    }
  end

  def render("update_user.json", %{user: user}) do
    %{
      user: render_one(user, __MODULE__, "user.json")
    }
  end

  def render("delete_user.json", %{user: _user}) do
    %{
      message: "User deleted"
    }
  end
end
