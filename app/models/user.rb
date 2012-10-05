class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :email, :username, :firstName, :lastName, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  # username validations
  validates :username, :presence => true,
		        :length              => { :maximum => 30 }
  # email validations
  validates :email, :presence     => true,
          		      :format       => { :with => email_regex },
          		      :uniqueness   => { :case_sensitive => false }
  # password validations
  validates :password, :presence     => true,
		        :length                  => { :minimum => 6 }
  # password_confirmation validations
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
