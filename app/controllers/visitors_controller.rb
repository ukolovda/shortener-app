class VisitorsController < ApplicationController

  def index
    if user_signed_in?
      redirect_to simple_urls_path
    end
  end
end
