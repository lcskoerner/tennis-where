class BookingsController < ApplicationController
  def index
    if params[:query].present?
      @bookings = Booking.where(date: params[:date])
    else
      @bookings = Booking.all
    end
  end
end
