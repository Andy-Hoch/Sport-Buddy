class RemoveColumnFromSportSession < ActiveRecord::Migration[7.0]
  def change
    remove_column :sport_sessions, :address
  end
end
