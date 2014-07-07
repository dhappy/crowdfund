class AddMinMaxToBid < ActiveRecord::Migration
  def change
    add_column :bids, :min, :decimal
    add_column :bids, :max, :decimal
  end
end
