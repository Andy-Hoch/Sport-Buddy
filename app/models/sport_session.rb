class SportSession < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  has_one :chatroom, dependent: :destroy
  has_many :attendees, dependent: :destroy
  has_many :participants, through: :attendees, source: :user
  has_many :session_categories
  has_many :sport_categories, through: :session_categories
end
