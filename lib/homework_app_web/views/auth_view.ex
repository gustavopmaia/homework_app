defmodule HomeworkAppWeb.AuthView do
  use HomeworkAppWeb, :view

  def render("login.json", %{token: token}), do: %{token: token}
end
