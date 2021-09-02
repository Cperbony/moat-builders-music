class Song < ApplicationRecord
  belongs_to :album

  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs

  validates :title, presence: true
  validates :album_id, presence: true
  validates :song_url, presence: true
end
