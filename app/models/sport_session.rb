class SportSession < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  belongs_to :user
  belongs_to :venue
  has_one :chatroom, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :participants, through: :attendees, source: :user
  has_many :session_categories
  has_many :sport_categories, through: :session_categories

  enum skill_level: %i[beginner intermediate advanced]
end
