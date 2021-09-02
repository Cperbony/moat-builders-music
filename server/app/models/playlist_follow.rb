# == Schema Information
#
# Table name: playlist_follows
#
#  id          :bigint           not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  playlist_id :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_playlist_follows_on_playlist_id              (playlist_id)
#  index_playlist_follows_on_user_id                  (user_id)
#  index_playlist_follows_on_user_id_and_playlist_id  (user_id,playlist_id) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (playlist_id => playlists.id)
#  fk_rails_...  (user_id => users.id)
#
class PlaylistFollow < ApplicationRecord
  belongs_to :user
  belongs_to :playlist

  validates :user_id, presence: true
  validates :playlist_id, presence: true
  validates :user_id, uniqueness: { scope: [:playlist_id] }
end
