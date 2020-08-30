class BookingsController < ApplicationController
  def index
    if params[:date].present?
      @bookings = Booking.where(date: params[:date])
    else
      @bookings = Booking.all
    end

    all_hours = (8..20).to_a
    occ_hours = @bookings.map(&:start_time)
    @slots = all_hours - occ_hours
    @date = params[:date]
  end

  def user_index
    @bookings = current_user.bookings
  end

  def new
    @booking = Booking.new(tennis_court_booking_params)
    @booking.user = current_user
    @date = params[:date]
  end

  def create
    @booking = Booking.new(tennis_court_booking_params)
    @booking.user = current_user
    @booking.save

    redirect_to tennis_court_path(@booking.tennis_court)
  end

  private

  def tennis_court_booking_params
    params.permit(:start_time, :tennis_court_id, :date)
  end
end
