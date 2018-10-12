class ShortUrlsController < ApplicationController

  def show
    @url = Url.find_by(shortened_code: params[:short_code])
    redirect_to @url.make_full_url
  end
  
end
