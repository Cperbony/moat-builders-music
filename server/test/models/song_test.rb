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
require "test_helper"

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
