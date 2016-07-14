class RolessHabtmPermissions < ActiveRecord::Migration
  def change
    create_table :roles_permissions do |t|
      t.references :role
      t.references :permission
    end
    add_index :roles_permissions, [:role_id, :permission_id]
    add_index :roles_permissions, [:permission_id, :role_id]
  end
end
