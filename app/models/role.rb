class Role < ActiveRecord::Base
  has_and_belongs_to_many :items, :join_table => :roles_items
  has_and_belongs_to_many :permissions, :join_table => :roles_permissions
end
