defmodule HomeworkAppWeb.QuestionView do
  alias HomeworkApp.Schemas.Questions

  def render("create_question.json", %{questions: %Questions{} = questions}) do
    %{
      message: "Question created",
      questions: questions
    }
  end

  def render("questions.json", %{questions: questions}) do
    %{
      questions: questions
    }
  end

  def render("question.json", %{question: %Questions{} = question}) do
    %{
      question: question
    }
  end

  def render("update_question.json", %{question: %Questions{} = question}) do
    %{
      question: question
    }
  end

  def render("delete_question.json", %{question: _question}) do
    %{
      message: "Question deleted"
    }
  end
end
