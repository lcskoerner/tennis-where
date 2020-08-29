class BookingsController < ApplicationController
  def slots
    if params[:date].present?
      @bookings = Booking
                  .where(date: params[:date])
                  .where(tennis_court_id: params[:tennis_court_id])
    else
      @bookings = Booking.all
    end

    all_hours = (8..20).to_a
    occ_hours = @bookings.map(&:start_time)
    @slots = all_hours - occ_hours
    @date = params[:date]
  end

  def confirm
    @start_time = params[:booking][:start_time]
    @date = params[:booking][:date]
    @tennis_court = TennisCourt.find(params[:tennis_court_id])
  end

  def create
    @booking = Booking.new(tennis_court_booking_params)
    @tennis_court = TennisCourt.find(params[:tennis_court_id])
    @booking.tennis_court = @tennis_court
    @booking.user = current_user
    @booking.save!

    redirect_to tennis_court_path(@booking.tennis_court)
  end

  private

  def tennis_court_booking_params
    params.require(:booking).permit(:start_time, :date)
  end
end
