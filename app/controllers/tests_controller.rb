class TestsController < ApplicationController
before_filter :authenticate_user!

  def new
    @user = current_user
    @course = Course.find params[:course_id]
  end

  def index
    @user = current_user
    @course = Course.find params[:course_id]
    correct = @user.answers_for(@course).reduce(0) { |a, e| a += e.correct ? 1 : 0 }
    @score = correct * 100 / @course.questions.count
    @test_result = @course.test_results.create
    @test_result.score = @score
    @user.test_results << @test_result
  end

end
