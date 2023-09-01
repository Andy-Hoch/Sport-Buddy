class AddEmojiToSportCategory < ActiveRecord::Migration[7.0]
  def change
    add_column :sport_categories, :emoji, :string
  end
end
