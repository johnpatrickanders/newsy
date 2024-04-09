class CreateGroups < ActiveRecord::Migration[7.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :limit
      t.boolean :archived
      t.boolean :private

      t.timestamps
    end
  end
end
