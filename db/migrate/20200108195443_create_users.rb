class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.integer :theme1
      t.integer :theme2
      t.integer :theme3
      t.string :default_country

      t.timestamps
    end
  end
end
