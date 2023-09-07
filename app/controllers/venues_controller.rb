class VenuesController < ApplicationController
  def create
    @venue = Venue.new(venue_params)
    authorize @venue
    if @venue.save
      redirect_to new_sport_session_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def venue_params
    params.require(:venue).permit(
      :name, :address
    )
  end
end
