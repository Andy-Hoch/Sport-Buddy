class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @sport_categories = policy_scope(SportCategory)
  end

  def list
    @created_sessions = current_user.my_events
    @joined_sessions = current_user.attendees
    @my_sessions = @created_sessions + @joined_sessions
  end
end
