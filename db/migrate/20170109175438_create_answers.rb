class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.belongs_to :question, null: false
      t.belongs_to :user, null: false
      t.text :description, null: false
      t.timestamps null: false
    end
  end
end
