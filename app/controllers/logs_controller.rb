class LogsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @logs = Log.last(50)
  end
end
