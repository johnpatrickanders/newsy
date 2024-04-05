class CreateSources < ActiveRecord::Migration[7.0]
  def change
    create_table :sources do |t|
      t.string :name
      t.text :description
      t.string :url
      t.string :tier
      t.date :date_founded

      t.timestamps
    end
  end
end
