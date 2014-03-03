class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :time
      t.reference :bidder
      t.decimal :amount
      t.reference :issue

      t.timestamps
    end
  end
end
