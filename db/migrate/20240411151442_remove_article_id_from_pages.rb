class RemoveArticleIdFromPages < ActiveRecord::Migration[7.0]
  def change
    remove_column :pages, :article_id, :integer
  end
end
