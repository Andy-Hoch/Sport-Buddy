class SportSession < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  belongs_to :chatroom
  has_many :attendees
  has_many :participants, through: :attendees, source: :user
  has_many :messages, through: :chatroom
  has_many :session_categories
  has_many :sport_categories, through: :session_categories
end
