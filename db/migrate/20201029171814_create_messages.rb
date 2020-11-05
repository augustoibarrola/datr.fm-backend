class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.belongs_to :sender, class_name: "User"
      t.belongs_to :recipient, class_name: "User"
      t.text :message_body

      t.timestamps
    end
  end
end
