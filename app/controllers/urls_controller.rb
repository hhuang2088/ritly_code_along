class UrlsController < ApplicationController
  def new
    @url = Url.new
  end

  def create 
    url = Url.create url_params
    url.random_string = SecureRandom.urlsafe_base64(6)
    if url.save
      redirect_to url
    else
      flash[:error] = "The url could not be saved. Try again"
      redirect_to root_path
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  private 
    def url_params
      params.require(:url).permit(:link)
    end

end
