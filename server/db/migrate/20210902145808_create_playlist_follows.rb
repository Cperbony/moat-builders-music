class CreatePlaylistFollows < ActiveRecord::Migration[6.1]
  def change
    create_table :playlist_follows do |t|
      t.references :user, null: false, foreign_key: true
      t.references :playlist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
