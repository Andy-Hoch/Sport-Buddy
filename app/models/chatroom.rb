class Chatroom < ApplicationRecord
  has_many :messages
  belongs_to :sport_session
end
