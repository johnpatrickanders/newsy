class AddPageIdToArticles < ActiveRecord::Migration[7.0]
  def change
    add_column :articles, :page_id, :integer, default: nil
  end
end
