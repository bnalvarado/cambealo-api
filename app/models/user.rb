class User < ActiveRecord::Base

	#User attributes
  before_create :set_defaults
  validates_presence_of :email, :password, on: :create
  validates_uniqueness_of :email
  has_many :products

  #Encrypt password before save user
  def set_encrypted_password
    unless password.blank?
      self.password = encrypt_password(password)
    end
  end

  #User authentication
  def self.authenticate(email, pass)
    user = self.getUser(email)
    return user if !user.nil? && user.password == user.encrypt_password(pass)
  end

  #Get user by email
  def self.getUser(email)
    return User.where(email: email).first
  end

  def set_defaults
    unless password.blank?
      self.password = encrypt_password(password)
    end
    #Set unique token
    self.token = loop do
      token = SecureRandom.urlsafe_base64
      break token unless User.where(token: token).first
    end
  end

  #Encrypt password
  def encrypt_password(pass)
    Digest::SHA1.hexdigest([pass].join)
  end

end