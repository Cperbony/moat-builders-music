class CreateAlbums < ActiveRecord::Migration[6.1]
  def change
    create_table :albums do |t|
      t.string :title
      t.integer :artist_id, null: false
      t.string :image_url, null: false, default: 'https://www.ninasimone.com/wp-content/uploads/2021/07/nina-simone-amazing-nina-simone-lp.jpg'
      t.text :description
      t.timestamps
    end
  end
end
