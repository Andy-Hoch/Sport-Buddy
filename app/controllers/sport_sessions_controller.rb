class SportSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[index show new create filter]
  before_action :set_sport_session, only: %w[show edit destroy]

  def index
    # ALL Sport Sessions
    @sport_sessions = policy_scope(SportSession)

    # 1. Filter to hide all Sessions which have already started...
    @sport_sessions = @sport_sessions.where('start_time > ?', Time.now)

    # 2. Filter is in the bottom, right now, line 35. Because we cannot continue filtering with joins on an array.

    # 3. Filter to show only the Sport Sessions of the Sport Category which is in the search.
    # We delete leading and trailing whitespace of the params variable.
    if params[:sport].present?
      @sport_sessions = @sport_sessions.joins(:sport_category).where("sport_categories.name ILIKE ?", params[:sport].strip)
    end

    # 4. Filter to show only the Sport Sessions where the address or the venue name is searched for.
    if params[:address].present?
      sql_subquery = "venues.address ILIKE :address OR venues.name ILIKE :address"
      @sport_sessions = @sport_sessions.joins(:venue).where(sql_subquery, address: "%#{params[:address]}%")
    end

    # 5. Filter to show all Sport sessions of the correct date
    date_params_exist = params[:date].present?

    if date_params_exist
      @date_value = params[:date].instance_of?(Array) ? params[:date][0] : params[:date].values[0]
      date_params_valid = @date_value.instance_of?(String) && @date_value.length == 10
      @sport_sessions = @sport_sessions.where("DATE(start_time) = ?", @date_value) if date_params_valid
    end

    # 2. Filter to hide all Sessions which are already full...
    @sport_sessions = @sport_sessions.reject do |session|
      session.attendees.count >= session.max_attendees
    end

    # Give the view some Markers
    @markers = @sport_sessions.map do |sportsession|
      { lat: sportsession.venue.latitude, lng: sportsession.venue.longitude,
        info_window_html: render_to_string(partial: "map_details", locals: { sportsession: sportsession }),
        marker_html: render_to_string(partial: "map_marker", locals: { sportsession: sportsession }) }
    end
  end

  def show
    @full = @sport_session.max_attendees == @sport_session.attendees.count
    @attending = Attendee.where("user_id = ? AND sport_session_id = ?", current_user, @sport_session).exists?
    @creator = current_user == @sport_session.user
    authorize @sport_session
    @markers = [
      {
        lat: @sport_session.venue.latitude,
        lng: @sport_session.venue.longitude,
        marker_html: render_to_string(partial: "map_marker", locals: { sportsession: @sportsession })
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
    @venue = Venue.new
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
    redirect_to my_sessions_path, status: :see_other
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
