class CreateHearts < ActiveRecord::Migration[6.0]
  def change
    create_table :hearts do |t|
      t.integer :liker_id
      t.integer :liked_id

      t.timestamps
    end
  end
end
