class AddUniquePairToPlaylistFollow < ActiveRecord::Migration[6.1]
  def change
    add_index :playlist_follows, [:user_id, :playlist_id], unique: true
  end
end
