class AddGithubNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :github_name, :string

    add_index :users, :github_name, unique: true
  end
end
