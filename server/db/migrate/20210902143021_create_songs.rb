class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :order
      t.text :lyrics
      t.string :track_url
      t.references :album_id, null: false

      t.timestamps
    end
  end
end
