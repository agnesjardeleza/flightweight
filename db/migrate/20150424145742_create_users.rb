class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :username
      t.string :password_hash
      t.string :password_salt
    	t.string :role
      t.timestamps
    end
  end
end
