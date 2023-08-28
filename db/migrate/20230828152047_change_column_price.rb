class ChangeColumnPrice < ActiveRecord::Migration[7.0]
  def change
    change_column :sport_sessions, :price, :float
  end
end
