class RepliesController < ApplicationController

  def create
    user = current_user
    answer = Answer.find params[:answer_id]
    question = answer.question
    user.answers << answer
    redirect_to (question.course.resume_test_path(user) || course_tests_path(question.course))
  end

end
