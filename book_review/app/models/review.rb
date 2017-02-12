class Review < ApplicationRecord
  belongs_to :book
  validates_inclusion_of :rating, :in => 1..5
  validates :reviewer, presence: true
  validates :post, presence: true
end
