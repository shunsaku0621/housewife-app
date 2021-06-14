class FavoritesController < ApplicationController
  before_action :authenticate_user!

  # お気に入り登録
  def create
   @cook = Cook.find(params[:cook_id])
   @user = @cook.user
   current_user.favorite(@cook)
   respond_to do |format|
    format.html { redirect_to request.referrer || root_url }
    format.js
   end
  end
  # お気に入り削除
  def destroy
    @cook = Cook.find(params[:cook_id])
    current_user.favorites.find_by(cook_id: @cook.id).destroy
    respond_to do |format|
      format.html { redirect_to request.referrer || root_url }
      format.js
    end
  end


end
