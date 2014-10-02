class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.text :lyrics
      t.integer :album_id

    end
  end
end
