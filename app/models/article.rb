class Article < ApplicationRecord
  belongs_to :user
  belongs_to :page, optional: true
  # belongs_to :source
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :title, presence: true
  validates :source_id, presence: true

  def photo
    "rails.svg"
  end
end
