class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create 
    url = Url.create(link: params[:url][:link])
    url.random_string = SecureRandom.urlsafe_base64(6)
    url.save
    redirect_to "/urls/#{url.id}"
  end

  def show
    @url = Url.find(params[:id])
  end

end
