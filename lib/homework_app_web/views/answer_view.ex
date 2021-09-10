defmodule HomeworkAppWeb.AnswerView do
  alias HomeworkApp.Schemas.Answers

  def render("answers.json", %{answers: answers}) do
    %{
      answers: answers
    }
  end

  def render("create_answer.json", %{answers: %Answers{} = answers}) do
    %{
      message: "Answer created",
      answers: answers
    }
  end

  def render("answer.json", %{answer: %Answers{} = answer}) do
    %{
      answer: answer
    }
  end
end
