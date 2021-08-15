class ReviewsController < ApplicationController
  def index
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to cook_reviews_path(@review.cook)
    else
      render "cooks/show"
    end
  end



  private
    def review_params
      params.require(:review).permit(:score, :content, :cook_id)
    end
end
