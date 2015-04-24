class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      
      t.integer :bidder_id
      t.integer :post_id
      t.integer :weight_to_be_used
      t.text    :details
      t.string  :ticket_id


      t.timestamps
    end
  end
end
