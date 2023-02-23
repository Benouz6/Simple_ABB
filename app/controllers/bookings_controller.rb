class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flat = Flat.find(params[:flat_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @flat = Flat.find(params[:flat_id])
    @booking.flat = @flat
    if @booking.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def my_travels
    @bookings = current_user.bookings
  end

  def my_reservations
    @bookings = Booking.select{ |book| book.user == current_user }
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
