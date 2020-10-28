class CreateLastfms < ActiveRecord::Migration[6.0]
  def change
    create_table :lastfms do |t|

      t.timestamps
    end
  end
end
