class AddCoordinatesToSportSessions < ActiveRecord::Migration[7.0]
  def change
    add_column :sport_sessions, :latitude, :float
    add_column :sport_sessions, :longitude, :float
  end
end
