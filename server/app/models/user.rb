class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  devise :trackable, :lockable

  has_many :playlist, dependent: :destroy
  has_many :playlist_follows, dependent: :destroy
  has_many :followed_playlists, through: :playlist_follows, source: :playlist

  validates :username, uniqueness: true, allow_blank: true
  validates :email, presence: true, uniqueness: true
end
