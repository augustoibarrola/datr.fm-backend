class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :username
      t.string :email
      t.text :description
      t.string :password_digest

      t.timestamps
    end
  end
end

# TODO drop database and before migrating user table again, change password to password_digest. 
# TODO password_digest is what 'bcrypt' gem will be looking for once installed =>> install it!