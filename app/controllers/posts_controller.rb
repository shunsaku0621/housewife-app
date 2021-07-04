class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :search, :show]
  before_action :search_post, only: [:index, :search]
  
  
  
  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
    set_post_column
  end

  def search
    @results = @p.result.all

    if params[:keyword] == ""
      tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
      render json:{ keyword: tag }
    end
  end

  def new
    @post = PostsTag.new
  end

  def create
    @post = PostsTag.new(post_params)
    tag_list = params[:post][:name].split(',')
    if @post.valid?
      @post.save(tag_list)
      flash[:notice] = '投稿が完了しました'
      return redirect_to posts_path
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:user)
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      flash[:notice] = '投稿を削除しました'
      redirect_to posts_path
    end
  end

  def edit
    @post = Post.find(params[:id])
    @form = PostsTag.new(post: @post)
  end

  def update
    @post = Post.find(params[:id])
    @form = PostsTag.new(post_params, post: @post)
    tag_list = params[:post][:name].split(",")
    if @form.valid?
      @form.save(tag_list)
      flash[:notice] = '投稿を編集しました'
      return redirect_to post_path(@post)
    else
      render :edit
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :text, :genre_id, :image, :name).merge(user_id: current_user.id)
  end


  def search_post
    @p = Post.ransack(params[:q])
  end


  def set_post_column
    @post_title = Post.select("genre_id").distinct 
  end


end
