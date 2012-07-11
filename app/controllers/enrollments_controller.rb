# encoding: utf-8
class EnrollmentsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  def new
    @course = Course.find(params[:course_id])
    @user = current_user
    @enrollment = Enrollment.new
  end

  def create
    @course = Course.find(params[:course_id])
    @user = current_user
    if @user.courses << @course && @user.update_attributes(params[:user])
      @user.send_enrollment_confirmation @course
      Log.new(message: "#{@user.name} enrolled to #{@course.title}").save
      redirect_to courses_path, :notice => "Deine Kursanmeldung war erfolgreich. Du erhältst eine Bestätigung per Email"
    else
      @user.courses.delete @course
      @enrollment = Enrollment.new
      render "new"
    end
  end

  def destroy
    @enrollment = Enrollment.find params[:id]
    if @enrollment.destroy
      Log.new(message: "#{current_user.name} cancelled #{@enrollment.course.title}").save
      redirect_to edit_user_path(current_user), :notice => "Abmeldung erfolgreich"
    end
  end

end
