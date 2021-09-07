class LabelsController < ApplicationController
    def show
        @label = Label.friendly.find(params[:id])
        @matches = @label.find_by_label
      end

    def new
        #@photo = Photo.find(params[:id])
        @photo = Photo.friendly.find(params[:photo_id])
        @label = @photo.labels.new
      end
    
      def create
        #@photo = Photo.find(params[:photo_id])
        @photo = Photo.friendly.find(params[:photo_id])
        @label = @photo.labels.new(label_params)
        if @label.save
          redirect_to photo_path(@photo)
        else
          flash[:notice] = 'Tag not saved'
          redirect_to photo_path(@photo)
        end
      end
      
      private
      def label_params
        params.require(:label).permit(:tag, :photo_id, :tag_list)
      end
end
