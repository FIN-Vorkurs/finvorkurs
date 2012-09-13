class SchedulesController < ApplicationController
  def index
    @schedule = []
    @schedule += Soiree.all
  end
end
