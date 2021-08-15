class ReviewsController < ApplicationController
  def index
    @cook = Cook.find(params[:cook_id])
    @reviews = @cook.reviews
  end
  
  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    if @review.save
      redirect_to cook_reviews_path(@review.cook)
    else
      @cook = Cook.find(params[:cook_id])
      render "cooks/show"
    end
  end



  private
    def review_params
      params.require(:review).permit(:score, :content, :cook_id)
    end
end
