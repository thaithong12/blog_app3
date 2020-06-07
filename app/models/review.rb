class Review < ApplicationRecord
  belongs_to :User
  belongs_to :Book
  has_many :comments, dependent: :destroy
end
