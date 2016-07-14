module ApplicationHelper

  def all_menus
    Item.where(:status => 1)
  end

  def all_permissions
    Permission.all
  end

  def all_permission_modules
    Permission.select(:module_name).distinct
  end

  def parent_menus
    Item.find_module_menus
  end

  def allRole
    Role.all
  end
end
