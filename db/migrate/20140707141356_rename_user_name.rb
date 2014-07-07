class RenameUserName < ActiveRecord::Migration
  def change
    rename_column :users, :github_name, :username
  end
end
