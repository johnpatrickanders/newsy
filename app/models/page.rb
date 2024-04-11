class Page < ApplicationRecord
  has_many :page_articles
  has_many :articles, :through => :page_articles
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :duration, presence: true
  validates :category, presence: true
end
