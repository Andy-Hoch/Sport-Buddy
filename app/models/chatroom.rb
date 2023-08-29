class Chatroom < ApplicationRecord
  belongs_to :sport_session
  has_many :messages, dependent: :destroy
  has_many :users, through: :messages
end
