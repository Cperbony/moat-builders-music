# == Schema Information
#
# Table name: songs
#
#  id          :bigint           not null, primary key
#  lyrics      :text
#  order       :integer
#  song_url    :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  album_id_id :bigint           not null
#
# Indexes
#
#  index_songs_on_album_id_id  (album_id_id)
#
class Song < ApplicationRecord
  belongs_to :album

  has_many :playlist_songs, dependent: :destroy
  has_many :playlists, through: :playlist_songs

  validates :title, presence: true
  validates :album_id, presence: true
  validates :song_url, presence: true
end
