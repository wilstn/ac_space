class Blog < ApplicationRecord
  has_many :comments, dependent: :destroy

  validates :title, uniqueness: true,
                    length: { minimum: 20 },
                    presence: true

  validates :author, presence: true,
                    length: { minimum: 5 },
                    format: { without: /\d/, message: "No numbers allowed"}

  validates :post, presence: true
                    # length: {minimum: 250, maximum: 2000}
end
