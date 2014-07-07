class AddMinMaxToBid < ActiveRecord::Migration
  def change
    add_column :bids, :min, :number
    add_column :bids, :max, :number
  end
end
