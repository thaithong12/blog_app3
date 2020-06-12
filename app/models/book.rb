class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :favorite_books ,dependent: :destroy
  has_many :reviews ,dependent: :destroy
  has_one_attached :image_url
  scope :by_created_at, -> { order(created_at: :asc) }
  # validates :book_name, :description,:author,:publish_date, presence :true
  
    def display_image
      image_url.variant resize_to_limit: [400, 300]
    end
end
