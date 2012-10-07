# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string(255)
#  email              :string(255)
#  firstName          :string(255)
#  lastName           :string(255)
#  password           :string(255)
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  salt               :string(255)
#  encrypted_password :string(255)
#  password_digest    :string(255)
#

require 'digest/sha2'

class User < ActiveRecord::Base
  attr_accessible :email, :username, :firstName, :lastName, :password, :password_confirmation
  
  has_secure_password
  
  email_regex = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  
  has_many :projects, :dependent => :destroy
  
  # username validations
  validates :username, :presence => true,
		        :length              => { :maximum => 30 }
  # email validations
  validates :email, :presence     => true,
          		      :format       => { :with => email_regex },
          		      :uniqueness   => true
  # password validations
  validates :password, :presence     => true,
		        :length                  => { :minimum => 6 }
  validates :password_confirmation, :presence => true
            
  before_save { self.email.downcase }
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
