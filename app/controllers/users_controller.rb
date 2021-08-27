class UsersController < ApplicationController

    def show    
      @user = User.friendly.find(params[:id])
      @photos = Photo.all
    end 
    
    def update
        @user = current_user
        @user.update(avatar_params)
        if @user.save
          redirect_to user_path
        else
          render :upload_avatar
        end
      end
    
end
