class CreatePlaylistSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_songs do |t|
      t.references :song, null: false
      t.references :playlist, null: false

      t.timestamps
    end
  end
end
