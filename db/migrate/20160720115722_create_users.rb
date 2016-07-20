class CreateUsers < ActiveRecord::Migration
  def change
    create_table :user do |t|
      t.string :name, null: false
      t.string :email, null: false, uniqueness: true
      t.string :password_digest, null: false

      t.timestamps null: false
    end
  end
end
