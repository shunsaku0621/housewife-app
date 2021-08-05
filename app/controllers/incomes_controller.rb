class IncomesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_income, only: [:edit, :update, :destroy]
  before_action :not_user_do_income, only: [:edit, :update, :destroy]

  def index
    @incomes = Income.order("created_at")
    @getmoneys = Getmoney.order("created_at")
    my_page_show
    sum_income
    sum_getmoney
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      flash[:notice] = '支出を登録しました'
      redirect_to incomes_path
    else 
      render :new
    end
  end

  
  def edit
  end

  def update
    if @income.update(income_params)
      flash[:notice] = '支出を編集しました'
      redirect_to incomes_path
    else 
      render "edit"
    end
  end

  def destroy
    @income.destroy
    flash[:notice] = '支出を削除しました'
    redirect_to incomes_path
  end


  private
  def income_params
    params.require(:income).permit(:amount, :memo, :category_id, :start_time).merge(user_id: current_user.id)
  end

  def my_page_show
    @day_params = params[:start_date]
  end


  def set_income
    @income = Income.find(params[:id])
  end

  def not_user_do_income
    unless current_user.id == @income.user_id
      redirect_to incomes_path
    end
  end

  def sum_income
    array = []
    Income.all.each do |income|
      if current_user.id == income.user_id
        array << income.amount
      end
    end
    @sum_income = array.sum
  end


  def sum_getmoney
    array = []
    Getmoney.all.each do |getmoney|
      if current_user.id == getmoney.user_id
        array << getmoney.amount
      end
    end
    @sum_getmoney = array.sum
  end

end
