class AttendeesController < ApplicationController
  def create
    @attendee = Attendee.new
    @attendee.user = current_user
    @sport_session = SportSession.find(params[:sport_session_id])
    @attendee.sport_session = @sport_session
    authorize @attendee
    if @attendee.save!
      redirect_to sport_session_path(@sport_session)
    else
      redirect_to sport_session_path(@sport_session), status: :unprocessable_entity
    end
  end
end
