class Book < ApplicationRecord
  belongs_to :User
  belongs_to :Category
  has_many :favoritebooks ,dependent: :destroy
  has_many :reviews ,dependent: :destroy
end
