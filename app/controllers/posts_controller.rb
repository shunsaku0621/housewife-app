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

  private

  def tweet_params
    params.require(:posts_tag).permit(:title, :text, :genre_id, :image, :name).merge(user_id: current_user.id)
  end
end
