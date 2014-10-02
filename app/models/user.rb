class User < ActiveRecord::Base
  attr_accessor :password

  validates :email, :session_token, presence: true
  validates :password_digest, presence: true

  after_initialize do
    ensure_session_token
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom.base64(16)
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

  def password=(password)
    return nil if password.length == 0
    self.password_digest = BCrypt::Password.create(password)
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
  end

private
  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end
end