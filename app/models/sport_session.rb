class SportSession < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  belongs_to :sport_category
  has_one :chatroom, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :participants, through: :attendees, source: :user

  enum skill_level: %i[beginner intermediate advanced]
end
