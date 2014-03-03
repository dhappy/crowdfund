class CreateBounties < ActiveRecord::Migration
  def change
    create_table :bounties do |t|
      t.datetime :expiration
      t.decimal :amount
      t.integer :currency
      t.reference :poster

      t.timestamps
    end
  end
end
