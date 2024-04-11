class RemovePageIdFromArticles < ActiveRecord::Migration[7.0]
  def change
    remove_column :articles, :page_id, :integer
  end
end
