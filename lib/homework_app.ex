defmodule HomeworkApp do
  alias HomeworkApp.User.Create, as: CreateUser
  alias HomeworkApp.User.Get, as: GetUser
  alias HomeworkApp.Question.Get, as: GetQuestion
  alias HomeworkApp.Question.Create, as: CreateQuestion
  alias HomeworkApp.Answer.Get, as: GetAnswer
  alias HomeworkApp.Answer.Create, as: CreateAnswer

  @moduledoc """
  HomeworkApp keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """
  defdelegate create_user(params), to: CreateUser, as: :call
  defdelegate get_user_by_id(params), to: GetUser, as: :by_id
  defdelegate fetch_all_users(), to: GetUser, as: :index

  defdelegate create_question(params), to: CreateQuestion, as: :call_question
  defdelegate fetch_all_questions(), to: GetQuestion, as: :index
  defdelegate get_question_by_id(params), to: GetQuestion, as: :by_id

  defdelegate create_asnwer(params), to: CreateAnswer, as: :call_answer
  defdelegate fetch_all_answers(), to: GetAnswer, as: :index
end
