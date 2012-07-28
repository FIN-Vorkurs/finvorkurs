# encoding: utf-8
class AnswersController < ApplicationController
before_filter :authenticate_admin!

  def create
    @answer = Answer.new params[:answer]
    @course = Course.find params[:course_id]
    @question = Question.find params[:question_id]
    if @question.answers << @answer
      redirect_to [@course, @question], notice: "Antwort hinzugefügt"
    end
  end
end
