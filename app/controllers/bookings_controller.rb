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
    my_bookings = current_user.flats
    @bookings = Booking.where(flat_id: my_bookings)
  end

  def accepted
    @booking = Booking.find(params[:id])
    @booking.status = 2
    @booking.save

    redirect_to my_reservations_path
  end

  def rejected
    @booking = Booking.find(params[:id])
    @booking.status = 2
    @booking.save
    redirect_to my_reservations_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
