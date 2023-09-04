class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @sport_categories = policy_scope(SportCategory)
  end

  def list
    created_sessions = SportSession.where(user_id: current_user.id)
    # joined_sessions = Attendee.where(user: current_user)
    @my_sessions = created_sessions # + joined_sessions
  end
end
