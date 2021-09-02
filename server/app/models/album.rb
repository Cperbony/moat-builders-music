# == Schema Information
#
# Table name: albums
#
#  id          :bigint           not null, primary key
#  description :text
#  image_url   :string           default("https://www.ninasimone.com/wp-content/uploads/2021/07/nina-simone-amazing-nina-simone-lp.jpg"), not null
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  artist_id   :integer          not null
#
class Album < ApplicationRecord
  belongs_to :artist
end
