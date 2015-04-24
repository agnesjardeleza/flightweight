class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      
      t.integer :user_id
      t.string  :first_name
      t.string  :last_name
      t.string  :mid_name
      t.date    :dob
      t.string  :address
      t.string  :contact_num
      t.string  :email

      
      t.timestamps
    end
  end
end
