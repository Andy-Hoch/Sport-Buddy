class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :sport_session
end
