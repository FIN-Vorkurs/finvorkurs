class SchedulesController < ApplicationController
  def index
    @schedule = []
    @schedule += Soiree.all
    @schedule += Lecture.all
    @schedule.sort_by!(&:date)
  end
end
