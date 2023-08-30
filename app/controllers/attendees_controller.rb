class AttendeesController < ApplicationController
  def create
    @attendee = Attendee.new
    @attendee.user = current_user
    @attendee.sport_session = SportSession.find(params[:sport_session_id])
    if @attendee.save
      redirect_to sport_sessions_path
    else
      render :new, status: :unprocessable_entity
    end
  end
end
