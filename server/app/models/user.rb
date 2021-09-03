class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :trackable, :lockable

  has_secure_password

  attr_reader :password

  has_many :playlist, dependent: :destroy
  has_many :playlist_follows, dependent: :destroy
  has_many :followed_playlists, through: :playlist_follows, source: :playlist

  validates :username, uniqueness: true, allow_blank: true
  validates :email, presence: true, uniqueness: true,
                    format: { with: /@/ }
  validates :password_digest,
            presence: { message: 'Password cannot be blank' }
  validates :session_token, presence: true

  def self.find_by_credentials(username, password)
    user ||= User.where(username: username, email: username)

    user && user&.valid_password?(password) ? user : nil
  end

  def reset_session_token!
    self.session_token = generate_session_token
    save!
    session_token
  end

  def generate_session_token
    SecureRandom.urlsafe_base64(128)
  end

  def valid_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end
end
