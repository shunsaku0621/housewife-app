class IncomesController < ApplicationController
  def index
    @incomes = Income.order("created_at")
    my_page_show
  end

  def new
    @income = Income.new
  end

  def create
    @income = Income.new(income_params)
    if @income.save
      redirect_to incomes_path
    else 
      render :new
    end
  end

  
  def edit
    @income = Income.find(params[:id])
  end

  def update
    @income = Income.find(params[:id])
    if @income.update(income_params)
      flash[:notice] = '家計簿を編集しました'
      redirect_to incomes_path
    else 
      render "edit"
    end
  end


  private
  def income_params
    params.require(:income).permit(:amount, :memo, :category_id, :start_time).merge(user_id: current_user.id)
  end

  def my_page_show
    @day_params = params[:start_date]
  end
end
