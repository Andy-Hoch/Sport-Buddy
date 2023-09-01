class SportSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[index show new create]
  before_action :set_sport_session, only: %w[show edit destroy]

  def index
    @sport_sessions = policy_scope(SportSession)
    if params[:query].present?
      @sport_sessions = @sport_sessions.where("sport_sessions.sport_category.name ILIKE ?", "%#{params[:query]}%")
    end
 #   @markers = @sport_sessions.venue.geocoded.map do |sport_session|
 #     {
 #       lat: sport_session.latitude,
 #       lng: sport_session.longitude
 #     }
 #   end
  end

  def show
    @full = @sport_session.max_attendees == @sport_session.attendees.count
    authorize @sport_session
    @marker = { lat: @sport_session.latitude, lng: @sport_session.longitude }
  end

  def new
    @sport_session = SportSession.new
    authorize @sport_session
  end

  def create
    @sport_session = SportSession.new(sport_session_params)
    @sport_session.user = current_user
    @sport_session.chatroom = Chatroom.create
    authorize @sport_session
    if @sport_session.save
      redirect_to sport_sessions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @sport_session.update(restaurant_params)
    redirect_to sport_session_path(@sport_session)
  end

  def destroy
    @sport_session.destroy
    redirect_to sport_sessions_path, status: :see_other
  end

  private

  def set_sport_session
    @sport_session = SportSession.find(params[:id])
  end

  def sport_session_params
    params.require(:sport_session).permit(
      :title,
      :description,
      :address,
      :start_time,
      :end_time,
      :skill_level,
      :max_attendees,
      :price,
      :venue_id
    )
  end
end
