class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      
      t.string  :first_name
      t.string  :last_name
      t.string  :mid_init
      t.date    :dob
      t.string  :address
      t.string  :contact_num
      t.string  :email

      
      t.timestamps
    end
  end
end
