class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.integer :poster_id
      t.integer :weight
      t.datetime   :date_of_flight
      t.text    :details
      t.integer :category
      t.string :category
      t.string  :flight_number
      t.boolean :is_active
      t.string :origin
      t.string :destination
       
      t.timestamps
    end
  end
end
