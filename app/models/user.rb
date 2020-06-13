class User < ApplicationRecord
    has_many :books ,dependent: :destroy
    has_many :reviews ,dependent: :destroy
    has_many :comments ,dependent: :destroy
    has_many :favorite_books ,dependent: :destroy
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    attr_accessor :remember_token, :activation_token, :reset_token
    before_save :downcase_email
    before_create :create_activation_digest
    validates :email, presence: true, uniqueness: true
    validates :user_name, :email, presence: true, length: {minimum: 2, maximum: 150}
    validates :email, length: {maximum: 255, message: "Max is 255"}, format: {with: VALID_EMAIL_REGEX}
    has_secure_password
    validates :password, length: {minimum: 4}, allow_nil: true
    has_one_attached :image_url
    #validates :image_url, allow_nil: true
    #validates :birthday, allow_nil: true
    #validates :address, length: {minimum: 2}, allow_nil: true
    
    def remember
      self.remember_token = SecureRandom.urlsafe_base64 
      self.update_attribute :remember_digest, User.digest(self.remember_token) 
    end  

    def forget
      self.update_attribute :remember_digest, nil
    end  

    def authenticate? attribute, token
      digest = send"#{attribute}_digest"
      return false if digest.nil?
      BCrypt::Password.new(digest).is_password?(token)
    end

    def activate
      update_attribute :is_active, true
      update_attribute :activated_at, Time.zone.now
    end  

    def send_activation_email
      UserMailer.account_activation(self).deliver_now
    end 

    def create_reset_digest 
      self.reset_token = SecureRandom.urlsafe_base64
      update_columns reset_digest: User.digest(reset_token), reset_sent_at: Time.zone.now
    end 
    
    def send_password_reset_email
      UserMailer.password_reset(self).deliver_now
    end
    def password_reset_expired?
      reset_sent_at < 5.minutes.ago
    end
    class << self
      def digest token
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
        BCrypt::Password.create(token, cost: cost)
      end
    end

    private
    def downcase_email
      self.email.downcase!
    end

    def create_activation_digest
      self.activation_token =SecureRandom.urlsafe_base64
      self.activation_digest =User.digest(activation_token)
    end
    
  
end
