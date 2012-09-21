class DownloadsController < ApplicationController
  def index
    @downloads = Download.all
  end
end
