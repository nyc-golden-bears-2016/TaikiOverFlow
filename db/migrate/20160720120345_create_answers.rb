class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :body, null:false
      t.integer :question_id, foreign_key: true
      t.integer :user_id, foreign_key: true
      t.boolean :best_answer, default: false

      t.timestamps null: false
    end
  end
end
