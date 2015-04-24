class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.integer :commenter_id
      t.integer :user_id
      t.integer :rating
      t.text    :comment

      t.timestamps
    end
  end
end
