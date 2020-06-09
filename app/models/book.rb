class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :favorite_books ,dependent: :destroy
  has_many :reviews ,dependent: :destroy
  has_one_attached :image_url
  scope :by_created_at, -> { order(created_at: :desc) }

    def display_image
      image_url.variant resize_to_limit: [500, 500]
    end
end
