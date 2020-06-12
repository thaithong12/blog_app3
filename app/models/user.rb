class User < ApplicationRecord
    has_many :books ,dependent: :destroy
	has_many :reviews ,dependent: :destroy
	has_many :comments ,dependent: :destroy
	has_many :favorite_books ,dependent: :destroy

	has_secure_password

	validates :email, presence: true, uniqueness: true
 
	
end
