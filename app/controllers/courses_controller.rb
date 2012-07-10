class CoursesController < ApplicationController
  def index
    @user = current_user
    @courses = Course.all
  end
end
