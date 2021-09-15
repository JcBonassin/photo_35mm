class PhotosController < ApplicationController

  #before_action :upvote, :downvote

  # GET /photos or /photos.json
  def index
    @photos = Photo.all
    @users = User.all
  end

  # GET /photos/1 or /photos/1.json
  def show
    #@photo = Photo.find(params[:id])
    #if params[:liked_photo]
    #  @photo = Photo.find_by_id(params[:liked_photo])
    #  @photo.liked_by current_user
    #end
    @photo = Photo.friendly.find(params[:id])
    @user = current_user
    @comment = Comment.new
    @label = Label.new
    
  end

  # GET /photos/new
  def new
    @user = current_user
    @photo = Photo.new
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos or /photos.json
  def create
    @user = current_user
    @photo = @user.photos.new(photo_params)
    if @photo.save
      redirect_to photo_path(@photo)
    else
      flash[:notice] = "Please complete all fields"
      redirect_to new_photo_path
      #render :new
    end
  end

  # PATCH/PUT /photos/1 or /photos/1.json
  def update
      @photo = Photo.friendly.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photo_path(@photo)
    else
      render photo_path(@photo)
    end
  end

  # DELETE /photos/1 or /photos/1.json
  def destroy
    @photo = Photo.friendly.find(params[:id])
    @photo.destroy
    params[:id] = nil
    flash[:notice] = "Photo has been deleted"
    redirect_to user_path(current_user)
  end

  def upvote
    @photo = Photo.friendly.find(params[:id])
    @photo.upvote_by current_user 
    redirect_to photo_path(@photo)  
  end
  
  def downvote   
      @photo = Photo.friendly.find(params[:id])
      @photo.downvote_by current_user
      redirect_to photo_path(@photo) 
  end

  def search
    @photos = Photo.search(params[:q])
  end 
 

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def photo_params
      params.require(:photo).permit(:title, :body, :image, :user_id, :tag_list, :tag, :label_list)
    end
end
