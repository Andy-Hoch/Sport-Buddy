class SportSessionsController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[index show]
  before_action :set_sport_session, only: %w[show edit]

  def index
    @sport_sessions = SportSession.all
  end

  def show
    @full = @sport_session.max_attendees == @sport_session.attendees.count?
  end

  def new
    @sport_session = SportSession.new
  end

  def create
    @sport_session.new(sport_session_params)
    @sport_session.user = current_user
    @sport_session.chatroom = Chatroom.create
    if @sport_session.save
      redirect_to sport_sessions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update

  end

  private

  def set_sport_session
    @sport_session = SportSession.find(params[:id])
  end

  def sport_session_params
    params.require(:sport_session).permit(:title, :description, :address, :start_time, :end_time, :skill_level, :max_attendees, :price, :venue_id)
  end
end
