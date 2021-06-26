class BlogsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_blog, only: [:edit, :update, :destroy, :show]
  before_action :not_user_do, only: [:edit, :update, :destroy, :show]

  def index
    @blogs = Blog.all
    @blog = Blog.new
  end

  def new
    @blog = Blog.new
  end

  def show
  end

  def create
    @blog = Blog.new(blog_parameter)
    if @blog.valid?
      @blog.save
      flash[:notice] = '予定を登録しました'
      redirect_to blogs_path
    else
      render "new"
    end
  end


  

  def destroy
    @blog.destroy
    flash[:notice] = '予定を削除しました'
    redirect_to blogs_path
  end

  def edit
  end

  def update
    if @blog.update(blog_parameter)
      flash[:notice] = '予定を変更しました'
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  private


  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time).merge(user_id: current_user.id)
  end



  def not_user_do
    unless current_user.id == @blog.user_id
      redirect_to blogs_path
    end
  end
end
