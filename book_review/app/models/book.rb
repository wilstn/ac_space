class Book < ApplicationRecord
  has_many :review, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :summary, presence: true

  def self.search(search)
    where("title LIKE ? OR author LIKE ? OR genre LIKE ? OR summary LIKE ?",
     "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
