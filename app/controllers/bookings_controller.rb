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

  def user_index
    @bookings = current_user.bookings
  end

  def search
    @date = params[:date].empty? ? Date.today.to_s : params[:date]

    @slots = []
    12.times do |t|
      @slots << { time: t + 8, occ: false }
    end

    @tennis_courts = TennisCourt.includes(:bookings)
    @tennis_courts = @tennis_courts.map do |tennis_court|
      {
        id: tennis_court.id,
        name: tennis_court.name,
        address: tennis_court.address,
        bookings: tennis_court.bookings.map { |b| b.start_time if b.date == @date },
        photo: tennis_court.photo.key,
        lat: tennis_court.latitude,
        lng: tennis_court.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { tennis_court: tennis_court })
      }
    end

    @markers = @tennis_courts.map do |t|
      {
        lat: t[:lat],
        lng: t[:lng],
        infoWindow: t[:infoWindow]
      }
    end
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
