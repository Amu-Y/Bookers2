class PostImagesController < ApplicationController
  
  def new
    @post_image = PostImage.new
  end
  

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path
    else
      render :new
    end
  end
  
  

  private

  def post_image_params
    params.require(:post_image).permit()
  end
  
end
