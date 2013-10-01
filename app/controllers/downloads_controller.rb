class DownloadsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @downloads = Download.all
  end
end
