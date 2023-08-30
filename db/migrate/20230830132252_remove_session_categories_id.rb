class RemoveSessionCategoriesId < ActiveRecord::Migration[7.0]
  def change
    drop_table :session_categories
  end
end
