class User < ApplicationRecord
    has_many :books ,dependent: :destroy
  	has_many :reviews ,dependent: :destroy
	  has_many :comments ,dependent: :destroy
  	has_many :favorite_books ,dependent: :destroy
	  VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    attr_accessor :remember_token
	  validates :email, presence: true, uniqueness: true
    validates :user_name, :email, presence: true, length: {minimum: 2, maximum: 150}
	  validates :email, length: {maximum: 255, message: "Max is 255"}, format: {with: VALID_EMAIL_REGEX}
    has_secure_password
    validates :password, length: {minimum: 6}, allow_nil: true
    
    def remember
      self.remember_token = SecureRandom.urlsafe_base64 
      self.update_attribute :remember_digest, User.digest(self.remember_token) 
    end  
    def forget
      self.update_attribute :remember_digest, nil
    end  
    def authenticate? token
      BCrypt::Password.new(self.remember_digest).is_password?(token)

    end
    class << self
      def digest token
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(token, cost: cost)
      end
    end
 
	
end
