class SportSession < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  belongs_to :chatroom
  has_many :sport_categories, through: :session_categories
end
