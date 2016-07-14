class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name
      t.string :description
      t.integer :resource_id
      t.string :resource_type

      t.timestamps null: false
    end
  end
end
