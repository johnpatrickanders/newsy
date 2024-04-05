class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :article_id
      t.integer :page_id
      t.integer :source_id
      t.string :type

      t.timestamps
    end
  end
end
