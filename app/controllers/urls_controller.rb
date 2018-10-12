class UrlsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user!
  before_action :fill_consts

  def index

  end

  def new
    @url = @urls.new
    3.times { @url.keywords.new }
  end

  def create
    @url = @urls.build(url_params)
    if @url.save
      redirect_to urls_path, notice: "URL created. Shortened url: #{shortened_url(@url)}"
    else
      render action: :new
    end
  end

  def edit
    @url = @urls.find(params[:id])
  end

  def update
    @url = @urls.find(params[:id])
    if @url.update(url_params)
      redirect_to urls_path, notice: "Data updated successfully"
    else
      render action: :new
    end
  end

  def destroy
    @url = @urls.find(params[:id])
    if @url.destroy
      redirect_to urls_path, notice: "URL deleted"
    else
      render action: :index, alert: "Deleting error. #{@url.errors..full_messages.to_sentence}"
    end
  end

  private

  def fill_consts
    @urls = current_user.urls
  end
  
  def url_params
    params.require(:url).permit(:name, :url, :ref, :extra, :ie,
                                keywords_attributes: [:id, :text, :page, :weight, :_destroy])
  end
end
