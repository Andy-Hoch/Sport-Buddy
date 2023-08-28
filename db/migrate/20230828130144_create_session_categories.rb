class CreateSessionCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :session_categories do |t|
      t.references :sport_category, null: false, foreign_key: true
      t.references :sport_session, null: false, foreign_key: true

      t.timestamps
    end
  end
end
