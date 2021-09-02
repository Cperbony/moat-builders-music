class PlaylistFollow < ApplicationRecord
  belongs_to :user
  belongs_to :playlist

  validates :user_id, presence: true
  validates :playlist_id, presence: true
  validates :user_id, uniqueness: { scope: [:playlist_id] }
end
