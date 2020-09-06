class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @tennis_court = TennisCourt.find(params[:tennis_court_id])
    @review.tennis_court = @tennis_court
    @review.save
    redirect_to tennis_court_path(@tennis_court)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
