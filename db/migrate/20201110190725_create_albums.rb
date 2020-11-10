class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.belongs_to :user
      t.string :name
      t.string :artist_name
      t.string :image_url

      t.timestamps
    end
  end
end
