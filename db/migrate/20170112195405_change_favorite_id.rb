class ChangeFavoriteId < ActiveRecord::Migration[5.0]
  def up
    remove_column :questions, :favorite
    add_column :questions, :favorite_id, :integer

  end
  def down
    add_column :questions, :favorite, :integer
    remove_column :questions, :favorite_id

  end
end
