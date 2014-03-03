class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :time
      t.references :bidder
      t.decimal :amount
      t.references :issue

      t.timestamps
    end
  end
end
