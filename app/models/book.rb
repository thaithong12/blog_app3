class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :favorite_books ,dependent: :destroy
  has_many :reviews ,dependent: :destroy

end
