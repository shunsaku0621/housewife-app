class GetmoneysController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_getmoney, only: [:edit, :update]


  def new
    @getmoney = Getmoney.new
  end

  def create
    @getmoney = Getmoney.new(getmoney_params)
    if @getmoney.save
      redirect_to incomes_path
    else 
      render :new
    end
  end

  def edit
  end

  def update
    if @getmoney.update(getmoney_params)
      flash[:notice] = '家計簿を編集しました'
      redirect_to incomes_path
    else 
      render "edit"
    end
  end


  private
  def getmoney_params
    params.require(:getmoney).permit(:amount, :memo, :category2_id, :start_time).merge(user_id: current_user.id)
  end

  def set_getmoney
    @getmoney = Getmoney.find(params[:id])
  end
end
