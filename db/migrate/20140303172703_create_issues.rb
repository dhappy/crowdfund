class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.string :description
      t.references :milestone

      t.timestamps
    end
  end
end