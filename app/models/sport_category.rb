class SportCategory < ApplicationRecord
  has_many :session_categories
  has_many :sport_sessions, through: :session_categories
end
