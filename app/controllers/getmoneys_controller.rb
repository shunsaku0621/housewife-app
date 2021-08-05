class GetmoneysController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_getmoney, only: [:edit, :update, :destroy]
  before_action :not_user_do_getmoney, only: [:edit, :update, :destroy]


  def new
    @getmoney = Getmoney.new
  end

  def create
    @getmoney = Getmoney.new(getmoney_params)
    if @getmoney.save
      flash[:notice] = '収入を登録しました'
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


  def destroy
    @getmoney.destroy
    flash[:notice] = '収入を削除しました'
    redirect_to incomes_path
  end


  private
  def getmoney_params
    params.require(:getmoney).permit(:amount, :memo, :category2_id, :start_time).merge(user_id: current_user.id)
  end

  def set_getmoney
    @getmoney = Getmoney.find(params[:id])
  end

  def not_user_do_getmoney
    unless current_user.id == @getmoney.user_id
      redirect_to incomes_path
    end
  end
end
