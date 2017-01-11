class ChangeFavorite < ActiveRecord::Migration[5.0]
  def up
    remove_column :answers, :favorite
    add_column :questions, :favorite, :integer

  end
  def down
    add_column :answers, :favorite, :boolean, default: false
    remove_column :questions, :favorite

  end
end
