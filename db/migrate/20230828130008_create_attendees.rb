class CreateAttendees < ActiveRecord::Migration[7.0]
  def change
    create_table :attendees do |t|
      t.references :user, null: false, foreign_key: true
      t.references :sport_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
