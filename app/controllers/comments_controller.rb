class CommentsController < ApplicationController

       def create
        @user = User.find(current_user.id)
        #@photo = Photo.find(params[:photo_id])
        @photo = Photo.friendly.find(params[:photo_id])
        @comment = @photo.comments.new(comment_params)
        if @comment.save
          redirect_to photo_path(@photo)
        else
          flash[:notice] = 'Comment not saved'
          redirect_to photo_path(@photo)
        end
      end

      def destroy
        @photo = Photo.friendly.find(params[:photo_id])
        @comment = @photo.comments.find(params[:id])
        @comment_id = params[:id]
        #@comment = current_user.comments.find(params[:id])
        @comment.destroy
        flash[:notice] = "Comment has been deleted"
        redirect_to photo_path(@photo)  
      end
    
      private
      def comment_params
        params.require(:comment).permit(:content, :user_id)
      end
end
