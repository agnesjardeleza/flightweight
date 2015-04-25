class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      
      t.integer :bidder_id
      t.integer :post_id
      t.integer :weight, default: 0
      t.text    :details
      t.string  :flight_number


      t.timestamps
    end
  end
end
