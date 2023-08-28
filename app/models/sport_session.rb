class SportSession < ApplicationRecord
  belongs_to :user
  belongs_to :venue
  belongs_to :chatroom
end
