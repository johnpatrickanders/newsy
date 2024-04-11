class Group < ApplicationRecord
  has_many :user_groups

  def show
    current_user.groups.all
  end
end
