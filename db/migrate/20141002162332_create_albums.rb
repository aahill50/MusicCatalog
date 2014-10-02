class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.string :recording_style
      t.integer :band_id

      t.timestamps
    end
  end
end
