class RemoveCoordinatesFromSportSession < ActiveRecord::Migration[7.0]
  def change
    remove_column :sport_sessions, :latitude, :float
    remove_column :sport_sessions, :longitude, :float
  end
end
