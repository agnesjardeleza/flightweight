class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      
      t.date   :date
      t.integer :poster
      t.integer :bidder
      t.integer :post_id
      t.integer :bid_id

      t.timestamps
    end
  end
end
