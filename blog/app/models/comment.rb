class Comment < ApplicationRecord
  belongs_to :blog

  validates :email, presence: true
  validates :remark, presence: true
end
