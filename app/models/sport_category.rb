class SportCategory < ApplicationRecord
  has_one_attached :card_image
  has_many :sport_sessions
end
# test
