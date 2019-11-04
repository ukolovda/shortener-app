class SimpleUrlClicksController < ApplicationController
  before_action :authenticate_user!
  before_action :fill_consts

  PAGE_SIZE = 100
  
  def index
    @simple_url_id = params[:simple_url_id]
    if @simple_url_id.present?
      @simple_url = current_user.simple_urls.find(@simple_url_id)
      @simple_url_clicks = @simple_url_clicks.where(simple_url_id: params[:simple_url_id])
    end

    if params[:begin_date].present?
      @begin_date = parse_date(params[:begin_date])
    else
      @begin_date = Date.today
    end

    if params[:end_date].present?
      @end_date = parse_date(params[:end_date])
    else
      @end_date = Date.today
    end

    @simple_url_clicks = @simple_url_clicks.
        where(clicked_at: @begin_date..@end_date+1.day-1.second).
        includes(:simple_url).order(clicked_at: :desc)
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

  def parse_date(str)
    return nil if str.blank?
    if str =~ /\A\d\d\d\d-\d\d-\d\d\Z/
      Time.strptime(str, '%Y-%m-%d')
    else
      if Date::DATE_FORMATS[:default] == '%d.%m.%Y'
        # Бывает, пропускают точку между параметрами, обрабатываем эту ситуацию
        case str
        when /\A\d\d\.\d\d\d\d\d\d\Z/
          Time.strptime(str, '%d.%m%Y')
        when /\A\d\d\d\d\.\d\d\d\d\Z/
          Time.strptime(str, '%d%m.%Y')
        when /\A\d\d\d\d\d\d\d\d\Z/
          Time.strptime(str, '%d%m%Y')
        else
          Time.strptime(str, Date::DATE_FORMATS[:default])
        end
      else
        Time.strptime(str, Date::DATE_FORMATS[:default])
      end
    end.to_date
  end

end
