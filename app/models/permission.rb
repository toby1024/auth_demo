class Permission < ActiveRecord::Base

  def self.load_permission_tree
    permission_array = []
    module_menus = Item.find_module_menus.pluck(:id, :pid, :name)
    permission_array += module_menus

    module_menus.each { |m|
      menus = Item.where("pid = ?", m[0]).order("order_number desc").pluck(:id, :pid, :name)
      permission_array += menus

      menus.each { |menu|
        permissions = Permission.find_by_sql(["select #{menu[0]} as pid,concat(#{menu[0]},'_',id) as id,description as name
                                        from permissions where menu_name = ? order by menu_name", menu[2]])

        permissions.each { |p|
          permission_array += Array[Array[p[:id], p[:pid], p[:name]]]
        }
      }
    }
    return_array = []
    permission_array.each { |p|
      menu = Item.new(:id => p[0], :pid => p[1], :name => p[2])
      return_array << menu
    }
    return_array
  end
end
