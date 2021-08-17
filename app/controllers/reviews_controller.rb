class ReviewsController < ApplicationController
  def index
    @cook = Cook.find(params[:cook_id])
    @reviews = @cook.reviews
    avg_score
    avg_score_percentage
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

    def avg_score
      unless @cook.reviews.empty?
        @avg_score_cook = @cook.reviews.average(:score).round(1).to_f
      else 
        @avg_score_cook = 0.0
      end
    end

    def avg_score_percentage
      unless @cook.reviews.empty?
        @avg_score_percentage = @cook.reviews.average(:score).round(1).to_f*100/5
      else 
        @avg_score_percentage = 0.0
      end
    end
end
