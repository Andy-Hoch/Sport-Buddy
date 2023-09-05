class Attendee < ApplicationRecord
  belongs_to :user
  belongs_to :sport_session
  validates :user, uniqueness: { scope: :sport_session }
end
