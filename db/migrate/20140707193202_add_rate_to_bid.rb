class AddRateToBid < ActiveRecord::Migration
  def change
    add_column :bids, :rate, :decimal
  end
end
