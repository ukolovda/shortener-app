class SimpleUrlClicksController < ApplicationController
  before_action :authenticate_user!
  before_action :fill_consts

  PAGE_SIZE = 100
  
  def index
    @simple_url_clicks = @simple_url_clicks.includes(:simple_url).order(clicked_at: :desc)
    respond_to do |format|
      format.html do
        @simple_url_clicks = @simple_url_clicks.page(params[:page]).per(PAGE_SIZE)
      end
      format.csv do
        send_data @simple_url_clicks.to_csv(%i(simple_url_name ip clicked_at)), filename: "simple_url_clicks.csv"
      end
    end
  end

  private

  def fill_consts
    @simple_url_clicks = current_user.simple_url_clicks
  end
  
end
