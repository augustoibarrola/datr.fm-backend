class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :username
      t.string :lastfm_username
      t.string :spotify_username
      t.string :email
      t.text :description
      t.string :password_digest

      t.timestamps
    end
  end
end

