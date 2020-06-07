class User < ApplicationRecord
    has_many :books ,dependent: :destroy
	has_many :reviews ,dependent: :destroy
	has_many :comments ,dependent: :destroy
	has_many :favoritebooks ,dependent: :destroy
end
