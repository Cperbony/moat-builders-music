class Playlist < ApplicationRecord
  belongs_to :user

  has_many :playlist_songs, dependent: :destroy
  has_many :songs, through: :playlist_songs
  has_many :playlist_follows, dependent: :destroy
  has_many :followers, through: :playlist_follows, source: :user

  validates :user_id, null: false
end
