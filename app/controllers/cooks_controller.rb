class CooksController < ApplicationController
  def index
    @cooks = Cook.all.order(created_at: :desc)
  end

  def new
    @cook = Cook.new
  end

  def create
    @cook = Cook.new(cook_params)
    if @cook.valid?
      @cook.save
      return redirect_to cooks_path
    else
      render "new"
    end
  
  end


  def show
    @cook = Cook.find(params[:id])
  end


  def edit
    @cook  = Cook.find(params[:id])
  end

  def update
    @cook = Cook.new(cook_params)
    if @cook.valid?
      @cook.save
      redirect_to cook_path(@cook)
    else 
      render "edit"
    end
  end

  def destroy
    @cook = Cook.find(params[:id])
    if @cook.destroy
      redirect_to cooks_path
    end
  end






  private
  def cook_params
    params.require(:cook).permit(:name, :description, :portion, :point, :reference, :time, :appearance, :memo, :image).merge(user_id: current_user.id)
  end

  
end
