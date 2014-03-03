class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :github_name
      t.string :name
      t.references :owner

      t.timestamps
    end
  end
end
