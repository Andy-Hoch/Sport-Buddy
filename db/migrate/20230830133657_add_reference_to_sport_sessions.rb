class AddReferenceToSportSessions < ActiveRecord::Migration[7.0]
  def change
    add_reference :sport_sessions, :sport_category, null: false, foreign_key: true
  end
end
