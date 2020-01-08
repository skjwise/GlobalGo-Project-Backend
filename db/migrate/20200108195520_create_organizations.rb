class CreateOrganizations < ActiveRecord::Migration[6.0]
  def change
    create_table :organizations do |t|
      t.string :city
      t.string :country
      t.string :url
      t.string :name
      t.text :mission
      t.integer :Gg_organization_id

      t.timestamps
    end
  end
end
