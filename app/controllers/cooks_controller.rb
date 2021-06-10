class CooksController < ApplicationController
  def index
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






  private
  def cook_params
    params.require(:cook).permit(:name, :description, :portion, :point, :reference, :time, :appearance, :memo).merge(user_id: current_user.id)
  end

end
