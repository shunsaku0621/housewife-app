class GetmoneysController < ApplicationController
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



  def getmoney_params
    params.require(:getmoney).permit(:amount, :memo, :category2_id, :start_time).merge(user_id: current_user.id)
  end

end
