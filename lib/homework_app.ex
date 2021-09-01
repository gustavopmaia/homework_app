defmodule HomeworkApp do
  alias HomeworkApp.User.Create, as: CreateUser
  alias HomeworkApp.User.Get, as: GetUser

  @moduledoc """
  HomeworkApp keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate get_user_by_id(params), to: GetUser, as: :by_id
end
