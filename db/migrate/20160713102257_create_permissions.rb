class CreatePermissions < ActiveRecord::Migration
  def change
    create_table :permissions do |t|
      t.string :action
      t.string :subject
      t.string :description
      t.string :module_name
      t.string :menu_name

      t.timestamps null: false
    end
  end
end
