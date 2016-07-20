class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value, null: false
      t.string :votable_type
      t.integer :votable_id
      t.integer :user_id, foreign_key: true

      t.timestamps null: false
    end
  end
end
