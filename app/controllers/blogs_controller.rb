class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
    @blog = Blog.new
  end

  def new
    @blog = Blog.new
  end

  def show
    @blog = Blog.find(params[:id])
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
    @blog = Blog.find(params[:id])
    @blog.destroy
    flash[:notice] = '予定を削除しました'
    redirect_to blogs_path
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_parameter)
      flash[:notice] = '予定を変更しました'
      redirect_to blogs_path
    else
      render 'edit'
    end
  end

  private

  def blog_parameter
    params.require(:blog).permit(:title, :content, :start_time)
  end
end
