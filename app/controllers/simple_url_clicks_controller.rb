class SimpleUrlClicksController < ApplicationController
  before_action :authenticate_user!
  before_action :fill_consts

  PAGE_SIZE = 100
  
  def index
    @simple_url_clicks = @simple_url_clicks.includes(:simple_url).order(clicked_at: :desc).page(params[:page]).per(PAGE_SIZE)
  end

  private

  def fill_consts
    @simple_url_clicks = current_user.simple_url_clicks
  end
  
end
