class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :summary, presence: true
end
