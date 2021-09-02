class CreatePlaylists < ActiveRecord::Migration[6.1]
  def change
    create_table :playlists do |t|
      t.integer :user_id, null: false
      t.string :image_url, default: 'https://www.ninasimone.com/wp-content/uploads/2021/07/ns-and-her-friends-alternates.png'
      t.string :title

      t.timestamps
    end
  end
end
