class SportCategory < ApplicationRecord
  has_many :sport_sessions, through: :session_categories
  has_many :session_categories
end
