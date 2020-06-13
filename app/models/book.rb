class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :favorite_books,dependent: :destroy
  has_many :reviews ,dependent: :destroy
  has_one_attached :image_url
  
  scope :by_created_at_asc, -> { order(created_at: :asc) }
  scope :by_created_at_desc, -> { order(created_at: :desc) }
  # validates :book_name, :description,:author,:publish_date, presence :true
    def display_image
      image_url.variant resize_to_limit: [360, 400]
    end
end
