class CreateUserStarredProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :user_starred_projects do |t|
      t.integer :user_id
      t.integer :project_id
      t.integer :order_number

      t.timestamps
    end
  end
end
