class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :title, null: false, default: "Untitled"
      t.integer :order
      t.text :lyrics
      t.string :track_url
      t.references :album, null: false

      t.timestamps
    end
  end
end
