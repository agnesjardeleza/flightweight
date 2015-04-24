class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|

      t.integer :poster_id
      t.integer :weight
      t.date   :date_of_flight
      t.text    :details
      t.integer :category
      t.string :category
      t.string  :ticket_id
      t.boolean :is_active
       
      t.timestamps
    end
  end
end
