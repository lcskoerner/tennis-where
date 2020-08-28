class BookingsController < ApplicationController
  def index
    if params[:query].present?
      @bookings = Booking.where(date: params[:query])
    else
      @bookings = Booking.all
    end

    all_hours = (8..20).to_a
    occ_hours = @bookings.map(&:start_hour)
    @slots = all_hours - occ_hours
  end
end
