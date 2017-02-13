class Book < ApplicationRecord
  has_many :review, dependent: :destroy

  validates :title, presence: true, uniqueness: true
  validates :author, presence: true
  validates :genre, presence: true
  validates :summary, presence: true

  has_attached_file :image, styles: { medium: "200x310>", thumb: "100x155>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def self.search(search)
    where("title LIKE ? OR author LIKE ? OR genre LIKE ? OR summary LIKE ?",
     "%#{search}%", "%#{search}%", "%#{search}%", "% #{search} %")
  end
end
