class PageArticle < ApplicationRecord
  belongs_to :page
  belongs_to :article
end
