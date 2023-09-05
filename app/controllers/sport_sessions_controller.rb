class SportSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[index show new create filter]
  before_action :set_sport_session, only: %w[show edit destroy]

  def index
    @sport_sessions = policy_scope(SportSession)
    @venues = @sport_sessions.map(&:venue)

    @markers = @venues.map do |venue|
      {
        lat: venue.latitude,
        lng: venue.longitude
      }
    end

    date_params_valid = false
    date_params_exist = params[:date].present?
    if date_params_exist
      date_params_valid = params[:date].first.empty? == false
    end

    if params[:sport].present?
      @sport_sessions = @sport_sessions.joins(:sport_category).where("sport_categories.name = ?", params[:sport])
    end

    if params[:address].present?
      sql_subquery = "venues.address ILIKE :address OR venues.name ILIKE :address"
      @sport_sessions = @sport_sessions.joins(:venue).where(sql_subquery, address: "%#{params[:address]}%")
    end

    if date_params_valid
      @sport_sessions = @sport_sessions.where("DATE(start_time) = ?", params[:date][0])
    end

   # @sport_sessions = SportSession.where("DATE(start_time) = ?", params[:date]) if params[:date].present? | params[:date] == ""
    #   @markers = @sport_sessions.venue.geocoded.map do |sport_session|
    #     {
    #       lat: sport_session.latitude,
    #       lng: sport_session.longitude
    #     }
    #   end
  end

  def show
    @full = @sport_session.max_attendees == @sport_session.attendees.count
    @attending = Attendee.where("user_id = ? AND sport_session_id = ?", current_user, @sport_session).exists?
    authorize @sport_session
    @markers = [
      {
        lat: @sport_session.venue.latitude,
        lng: @sport_session.venue.longitude
      }
    ]
  end

  def new
    @sport_session = SportSession.new
    @venue = Venue.new
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
      :sport_category_id,
      :price,
      :venue_id
    )
  end
end
