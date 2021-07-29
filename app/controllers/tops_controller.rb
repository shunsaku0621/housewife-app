class TopsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def show
    # binding.pry
    favorites = Favorite.where(user_id: current_user.id).order(created_at: :desc).pluck(:cook_id)
    @favorites = Cook.find(favorites)
  end
end
