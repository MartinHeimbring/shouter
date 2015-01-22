class ShoutsController < ApplicationController
  def create
    shout = current_user.shouts.create(shouts_params)
    if shout.save
      redirect_to dashboard_path
    else
      flash[:danger] = "Could not shout."
      redirect_to dashboard_path
    end
  end

  def show
    @shout = Shout.find(params[:id])
  end

  private

  def shouts_params
    params.require(:shout).permit(:body)
  end
end