class RssSourcesController < ApplicationController 
  before_action :authorize
  before_action :set_source, only: [:edit, :update]

  def index 
    @rss_sources = current_user.rss_sources
  end

  def create 
    if @source = current_user.rss_sources.create(source_params)
      render json: @source
    end
  end

  private
  def source_params
    params.require(:rss_source).permit(
      :url, :user, :title)
  end

  def set_source
    if params[:id]
      @source = RssSource.find(:id)
    end
  end
end
