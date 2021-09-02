class ChangeColumnOfSong < ActiveRecord::Migration[6.1]
  def change
    rename_column :songs, :track_url, :song_url
  end
end
