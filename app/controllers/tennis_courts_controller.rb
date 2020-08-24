class TennisCourtsController < ApplicationController
  def index
    @tennis_courts = Tennis_court.all
  end

  def new
    @tennis_court = Tennis_court.new
  end

  def create
    @tennis_court = Tennis_court.new(tennis_court_params)
    @tennis_court.save

    redirect_to tennis_court_path(@tennis_court)

  end

  def show
    @tennis_court = Tennis_court.find(params[:id])
  end

   def edit
    @tennis_court = Tennis_court.find(params[:id])
  end

  def update
    @tennis_court = Tennis_court.find(params[:id])
    @tennis_court.update(tennis_court_params)

    redirect_to tennis_court_path(@tennis_court)
  end


  def destroy
    @tennis_court = Tennis_court.find(params[:id])
    @tennis_court.destroy

    redirect_to tennis_court_path
  end
  private

  def tennis_court_params
    params.require(:tennis_court).permit(:name, :address, :price_per_hour, :detail)
  end
end
