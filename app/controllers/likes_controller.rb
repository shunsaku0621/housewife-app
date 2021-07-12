class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(cook_id: params[:cook_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @cook = Cook.find(params[:cook_id])
    @like = current_user.likes.find_by(cook_id: @cook.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end

end
