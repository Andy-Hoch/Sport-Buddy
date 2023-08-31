class SportSession < ApplicationRecord
  geocoded_by :address
  # after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  belongs_to :venue
  belongs_to :sport_category
  has_one :chatroom, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :participants, through: :attendees, source: :user

  enum skill_level: %i[beginner intermediate advanced]
end
