class PhotoShoutsController < ApplicationController
  def create
    content = build_content
    logger.debug "CONTENT TO BE PASSED TO SHOUT: #{content}"
    shout = current_user.shouts.create(content: content)
    if shout.save
      redirect_to dashboard_path
    else
      flash[:danger] = "Could not shout."
      redirect_to dashboard_path
    end
  end

  private

  def build_content
    PhotoShout.new(photo_shouts_params)
  end

  def photo_shouts_params
    params.require(:photo_shout).permit(:image)
  end
end