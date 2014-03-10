class AddIssueToBounty < ActiveRecord::Migration
  def change
    add_reference :bounties, :issue
  end
end
