class FlatsController < ApplicationController

  def index
    @flats = Flat.geocoded
    @markers = @flats.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { flat: flat }),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.user = current_user
    if @flat.save
      redirect_to flat_path(@flat)
    else
      render :new
    end
  end

  def show
    @flat = Flat.find(params[:id])
    @reviews = Review.where(flat_id: @flat.id)
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to flats_path, status: :see_other
  end

  def my_flats
    @flats = current_user.flats
  end

  def result
    if params[:query].present?
      @flats = Flat.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @flats = Flat.all
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price, photos: [])
  end
end
