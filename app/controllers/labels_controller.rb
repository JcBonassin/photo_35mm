class LabelsController < ApplicationController
    def show 
        @photos = Photo.tagged_with(params[:id], :any => true)
        @label = params[:id]
        #@label = Label.find(params[:id])
        #@matches = @label.find_by_label
        #@label = Label.friendly.find(params[:id])
        #@matches = @label.find_by_label
      end

    def index 
      @labels = Label.all 
      if params[:tag]
      @photos = Photo.tagged_with(params[:id], :any => true)
    else
      @photos = Photo.all
    end
      
    end 

    def tag_cloud
      @tags = Photo.tag_counts_on(:tags)
    end

    def added_tags
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
        params.require(:label).permit(:user_id, :tag, :photo_id, :tag_list)
      end
end
