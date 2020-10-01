class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @tennis_court = TennisCourt.find(params[:tennis_court_id])
    @review = Review.new(review_params)
    @review.user = current_user
    @review.tennis_court = @tennis_court
    if @review.save
      redirect_to tennis_court_path(@tennis_court)      
    else
      render "tennis_courts/show"  
    end
    
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
