class CoursesController < ApplicationController
  before_filter :authenticate_admin!, only: [:show]
  def index
    @user = current_user
    @courses = Course.all
  end

  def show
    @course = Course.find params[:id]
  end
end
