class SessionCategory < ApplicationRecord
  belongs_to :sport_category
  belongs_to :sport_session

  validates :session_category, inclusion: { in: SESSION_CATEGORIES }
end
