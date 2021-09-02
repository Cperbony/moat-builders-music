# == Schema Information
#
# Table name: playlists
#
#  id         :bigint           not null, primary key
#  image_url  :string           default("https://www.ninasimone.com/wp-content/uploads/2021/07/ns-and-her-friends-alternates.png")
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
class Playlist < ApplicationRecord
  belongs_to :user

  has_many :playlist_songs, dependent: :destroy
  has_many :songs, through: :playlist_songs
  has_many :playlist_follows, dependent: :destroy
  has_many :followers, through: :playlist_follows, source: :user

  validates :user_id, null: false
end
