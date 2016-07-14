class CreateRolesItems < ActiveRecord::Migration
  def change
    create_table :roles_items do |t|
      t.belongs_to :role, index: true
      t.belongs_to :item, index: true
    end
  end
end
