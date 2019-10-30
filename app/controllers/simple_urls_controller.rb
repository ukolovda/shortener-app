class SimpleUrlsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!
  before_action :fill_consts

  PAGE_SIZE = 2
  
  def index
    @simple_urls = @simple_urls.order(:name).page(params[:page]).per(PAGE_SIZE)
  end

  def show
    @simple_url = @simple_urls.find(params[:id])
  end
  
  def new
    @simple_url = @simple_urls.new
  end

  def create
    @simple_url = @simple_urls.build(simple_url_params)
    if @simple_url.save
      redirect_to simple_urls_path, notice: "URL created. Shortened url: #{aliased_url(@simple_url)}"
    else
      render action: :new
    end
  end

  def edit
    @simple_url = @simple_urls.find(params[:id])
  end

  def update
    @simple_url = @simple_urls.find(params[:id])
    if @simple_url.update(simple_url_params)
      redirect_to simple_urls_path, notice: "Data updated successfully"
    else
      render action: :new
    end
  end

  def destroy
    @simple_url = @simple_urls.find(params[:id])
    if @simple_url.destroy
      redirect_to simple_urls_path, notice: "URL deleted"
    else
      render action: :index, alert: "Deleting error. #{@url.errors..full_messages.to_sentence}"
    end
  end

  private

  def fill_consts
    @simple_urls = current_user.simple_urls
  end
  
  def simple_url_params
    params.require(:simple_url).permit(:name, :alias, :url)
  end
end
