# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#创建角色
r1 = Role.create({name: "Admin", description: "超级用户"})
Role.create({name: "Seller", description: "合伙人"})

#创建超级管理员
u1 = User.create({email: "admin@admin.tt", phone: "13634171404", company: "skio", f_code: "13634171404", password: "123456", username: "Admin"})
UsersRole.create({user_id: u1.id, role_id: r1.id})

#菜单
i1 = Item.create({name: "系统管理", url: "#", status: 1, order_number: 0})
i2 = Item.create({name: "用户管理", url: "users", status: 1, order_number: 9, pid: 1})
i3 = Item.create({name: "角色管理", url: "roles", status: 1, order_number: 8, pid: 1})
i4 = Item.create({name: "菜单管理", url: "items", status: 1, order_number: 7, pid: 1})
i5 = Item.create({name: "权限管理", url: "permissions", status: 1, order_number: 6, pid: 1})
#角色菜单权限
rolesTimes = RolesItem.create([{role_id: r1.id, item_id: i1.id},
                               {role_id: r1.id, item_id: i2.id},
                               {role_id: r1.id, item_id: i3.id},
                               {role_id: r1.id, item_id: i4.id},
                               {role_id: r1.id, item_id: i5.id}
                              ])
#controller权限
permissions = Permission.create([{action: "read", subject: "User", module_name: "系统管理", menu_name: "用户管理", description: "查看用户"},
                                 {action: "create", subject: "User", module_name: "系统管理", menu_name: "用户管理", description: "创建用户"},
                                 {action: "update", subject: "User", module_name: "系统管理", menu_name: "用户管理", description: "修改用户"},
                                 {action: "destroy", subject: "User", module_name: "系统管理", menu_name: "用户管理", description: "删除用户"},
                                 {action: "read", subject: "Role", module_name: "系统管理", menu_name: "角色管理", description: "查看角色"},
                                 {action: "create", subject: "Role", module_name: "系统管理", menu_name: "角色管理", description: "创建角色"},
                                 {action: "update", subject: "Role", module_name: "系统管理", menu_name: "角色管理", description: "修改角色"},
                                 {action: "destroy", subject: "Role", module_name: "系统管理", menu_name: "角色管理", description: "删除角色"},
                                 {action: "read", subject: "Item", module_name: "系统管理", menu_name: "菜单管理", description: "查看菜单"},
                                 {action: "read", subject: "Item", module_name: "系统管理", menu_name: "菜单管理", description: "查看菜单"},
                                 {action: "create", subject: "Item", module_name: "系统管理", menu_name: "菜单管理", description: "创建菜单"},
                                 {action: "update", subject: "Item", module_name: "系统管理", menu_name: "菜单管理", description: "修改菜单"},
                                 {action: "destroy", subject: "Item", module_name: "系统管理", menu_name: "菜单管理", description: "删除菜单"},
                                 {action: "read", subject: "Permission", module_name: "系统管理", menu_name: "权限管理", description: "查看权限"},
                                 {action: "create", subject: "Permission", module_name: "系统管理", menu_name: "权限管理", description: "创建权限"},
                                 {action: "update", subject: "Permission", module_name: "系统管理", menu_name: "权限管理", description: "修改权限"},
                                 {action: "destroy", subject: "Permission", module_name: "系统管理", menu_name: "权限管理", description: "删除权限"}
                                ])
