class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def new
    @post = PostsTag.new
  end

  def create
    @post = PostsTag.new(tweet_params)
    if @post.valid?
      @post.save
      return redirect_to posts_path
    else
      render "new"
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to posts_path
    end
  end

  # def edit
  #   @post = Post.find(params[:id])
  #   @posts_tag = PostsTag.new(post: @post)
  # end

  # def update
  #   @post = Post.find(params[:id])
  #   @posts_tag = PostsTag.new(tweet_params, post: @post)
  #   tag_list = params[:posts_tag][:name].split(",")
  #   if @posts_tag.valid?
  #     @posts_tag.save(tag_list)
  #     return redirect_to post_path(@post)
  #   else
  #     render :edit
  #   end

  # end

  private

  def tweet_params
    params.require(:posts_tag).permit(:title, :text, :genre_id, :image, :name).merge(user_id: current_user.id)
  end


end