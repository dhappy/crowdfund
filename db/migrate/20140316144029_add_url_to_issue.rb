class AddUrlToIssue < ActiveRecord::Migration
  def change
    add_column :issues, :url, :text
  end
end
