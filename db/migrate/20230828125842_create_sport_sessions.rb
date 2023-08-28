class CreateSportSessions < ActiveRecord::Migration[7.0]
  def change
    create_table :sport_sessions do |t|
      t.string :title
      t.string :description
      t.string :address
      t.timestamp :start_time
      t.timestamp :end_time
      t.integer :skill_level
      t.integer :max_attendees
      t.decimal :price
      t.references :user, null: false, foreign_key: true
      t.references :venue, null: false, foreign_key: true
      t.references :chatroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
