# == Schema Information
#
# Table name: playlist_songs
#
#  id             :bigint           not null, primary key
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  playlist_id_id :bigint           not null
#  song_id_id     :bigint           not null
#
# Indexes
#
#  index_playlist_songs_on_playlist_id_id  (playlist_id_id)
#  index_playlist_songs_on_song_id_id      (song_id_id)
#
class PlaylistSong < ApplicationRecord
  belongs_to :song
  belongs_to :playlist

  validates :song_id, presence: true
  validates :playlist_id, presence: true
end
