class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.integer :user_id, foreign_key: true

      t.timestamps null: false
    end
  end
end
