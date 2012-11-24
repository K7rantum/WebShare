require 'digest/sha2'

class User < ActiveRecord::Base
  attr_accessible :email, :username, :firstName, :lastName, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  has_many :projects, :dependent => :destroy
  
  # username validations
  validates :username, :presence => true,
		        :length              => { :in => 6..20 },
            :uniqueness          => { :case_sensitive => false }
  # email validations
  validates :email, :presence     => true,
          		      :format       => { :with => VALID_EMAIL_REGEX },
          		      :uniqueness   => { :case_sensitive => false }
  # password validations
  validates :password, :presence     => true,
		        :length                  => { :minimum => 7 }
  validates :password_confirmation, :presence => true
            
  before_save :encrypt_password
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    return user if user.has_password?(submitted_password)
  end
  
  private
  
    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
  
    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end
    
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
    
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
    
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

end
