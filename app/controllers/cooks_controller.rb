class CooksController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_cook, only: [:edit, :update, :destroy, :show]
  def index
    @cooks = Cook.includes(:user).order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @cook = Cook.new
  end

  def create
    @cook = Cook.new(cook_params)
    if @cook.valid?
      @cook.save
      flash[:notice] = '投稿が完了しました'
      return redirect_to cooks_path
    else
      render "new"
    end
  
  end


  def show
    @review = Review.new
  end


  def edit
  end

  def update
    if @cook.update(cook_params)
      flash[:notice] = '投稿を編集しました'
      redirect_to cook_path(@cook)
    else 
      render "edit"
    end
  end

  def destroy
    if @cook.destroy
      flash[:notice] = '投稿を削除しました'
      redirect_to cooks_path
    end
  end






  private
  def cook_params
    params.require(:cook).permit(:name, :description, :portion, :point, :reference, :time, :appearance, :memo, :image).merge(user_id: current_user.id)
  end


  def set_cook
    @cook = Cook.find(params[:id])
  end
  
end
