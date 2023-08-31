class SportCategory < ApplicationRecord
  has_one_attached :photo
  has_many :sport_sessions
end
