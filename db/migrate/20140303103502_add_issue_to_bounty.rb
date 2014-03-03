class AddIssueToBounty < ActiveRecord::Migration
  def change
    add_column :bounties, :issue, :reference
  end
end
