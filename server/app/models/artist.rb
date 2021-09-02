class Artist < ApplicationRecord
  has_many :albuns, dependent: :destroy

  validates :name, presence: true
  validates :image_url, presence: true
end
