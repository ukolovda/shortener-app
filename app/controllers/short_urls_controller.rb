class ShortUrlsController < ApplicationController

  def show
    @url = SimpleUrl.find_by(alias: params[:short_code])
    if @url
      @url.clicks.create! clicked_at: Time.now, ip: request.remote_ip
      redirect_to @url.url
    else
      @url = Url.find_by(shortened_code: params[:short_code])
      redirect_to @url.make_full_url
    end
  end

end
