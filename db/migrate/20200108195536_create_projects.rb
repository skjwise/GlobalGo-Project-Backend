class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :status
      t.string :summary
      t.string :theme_str_id
      t.string :title
      t.string :image_url
      t.string :project_link
      t.string :country
      t.float :funding
      t.float :goal
      t.float :latitude
      t.float :longitude
      t.text :need
      t.text :long_term_impact
      t.text :activities
      t.text :donation_descriptions
      t.integer :theme_id
      t.integer :gg_project_id
      t.integer :gg_organization_id
      t.integer :country_id
      t.integer :organization_id
      t.integer :donation_amounts

      t.timestamps
    end
  end
end
