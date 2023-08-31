class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @sport_categories = policy_scope(SportCategory)
  end
end
