class ReviewsController < ApplicationController

  def new
    @tennis_court = Tennis_court.find(params[:restaurant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @tennis_court = Tennis_court.find(params[:tennis_court_id])
    @review.tennis_court = @tennis_court
    @review.save
  end

  private

  def review_params
    params.require(:review).permit(:content)
  end
end
