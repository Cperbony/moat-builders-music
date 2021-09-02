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
require "test_helper"

class PlaylistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
