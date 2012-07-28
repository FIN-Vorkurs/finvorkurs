class QuestionsController < ApplicationController
before_filter :authenticate_user!
before_filter :authenticate_admin!, except: :show

  def show
    @question = Question.find params[:id]
    @course = Course.find params[:course_id]
    @user = current_user
  end

  def new
    @question = Question.new
    @course = Course.find params[:course_id]
  end

  def create
    @course = Course.find params[:course_id]
    @question = Question.new params[:question]
    @course.questions << @question
    redirect_to [@course, @question], notice: "Frage erstellt"
  end

end
