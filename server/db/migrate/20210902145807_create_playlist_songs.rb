class CreatePlaylistSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_songs do |t|
      t.references :song_id, null: false
      t.references :playlist_id, null: false

      t.timestamps
    end
  end
end
