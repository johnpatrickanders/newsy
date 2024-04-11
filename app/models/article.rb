class Article < ApplicationRecord
  belongs_to :user
  has_many :page_articles
  has_many :pages, :through => :page_articles
  # belongs_to :source
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :source_id, presence: true

  accepts_nested_attributes_for :page_articles

  def photo
    "rails.svg"
  end
end
