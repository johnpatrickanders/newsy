class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.text :title
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.string :url
      t.references :source, null: false, foreign_key: true

      t.timestamps
    end
  end
end
