class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.text :name
      t.text :description
      t.references :milestone

      t.timestamps
    end
  end
end
