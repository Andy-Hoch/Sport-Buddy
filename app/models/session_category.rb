class SessionCategory < ApplicationRecord
  belongs_to :sport_category
  belongs_to :sport_session
end
