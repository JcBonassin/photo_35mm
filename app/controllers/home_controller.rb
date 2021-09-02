class HomeController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @photos = Photo.all
    @user = current_user 
  end

end
